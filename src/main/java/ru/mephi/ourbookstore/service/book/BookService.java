package ru.mephi.ourbookstore.service.book;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.time.LocalDate;
import java.util.List;
import jakarta.persistence.EntityManager;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.hibernate.search.engine.search.query.SearchResult;
import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.massindexing.MassIndexer;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.book.BookFilterDefaultsDto;
import ru.mephi.ourbookstore.domain.dto.book.BookSearchRqDto;
import ru.mephi.ourbookstore.mapper.book.BookModelMapper;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.service.author.AuthorService;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.InterruptedIndexerException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

import static ru.mephi.ourbookstore.domain.Entities.BOOK;


/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookService {

    final BookRepository bookRepository;
    final BookModelMapper bookModelMapper;
  
    final EntityManager entityManager;
    final AuthorService authorService;
    static int INDEXER_THREADS = 6;
    static int BOOK_PER_PAGE = 3;

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true, noRollbackFor = Exception.class)
    public Book getById(long bookId) {
        BookModel bookModel = bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        return bookModelMapper.modelToObject(bookModel);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true, noRollbackFor = Exception.class)
    public List<Book> getAll() {
        return bookRepository.findAll().stream()
                .map(bookModelMapper::modelToObject)
                .toList();
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true, noRollbackFor = Exception.class)
    public Page<Book> getByPageNumber(int pageNumber) {
        if (pageNumber < 0) {
            throw new ValidationException("Page index must not be less than zero");
        }
        return bookRepository.findAll(PageRequest.of(pageNumber, BOOK_PER_PAGE)).map(bookModelMapper::modelToObject);
    }
  
    public List<Book> search(BookSearchRqDto bookSearchRqDto) {
        int offset = bookSearchRqDto.getPageNumber() * BOOK_PER_PAGE;
        SearchSession searchSession = Search.session(entityManager);

        LocalDate dateFrom;
        if (bookSearchRqDto.getDateOfBirthFrom() == null) {
            dateFrom = LocalDate.MIN;
        } else {
            dateFrom = LocalDate.parse(bookSearchRqDto.getDateOfBirthFrom());
        }

        LocalDate dateTo;
        if(bookSearchRqDto.getDateOfBirthTo() == null) {
            dateTo = LocalDate.MAX;
        } else {
            dateTo = LocalDate.parse(bookSearchRqDto.getDateOfBirthTo());
        }

        runIndexing(searchSession);

        SearchResult<BookModel> searchResult = searchSession
                .search(BookModel.class)
                .where(f->f.bool()
                        .must(f.match().fields().fields("name", "authors.fullName").matching(bookSearchRqDto.getSearchText()).fuzzy())
                        .must(f.range().field("authors.dateOfBirth").between(dateFrom, dateTo)))
                .fetch(offset, BOOK_PER_PAGE);

        return searchResult.hits().stream()
                .map(bookModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public Long create(Book book) {
        validate(book);
        String name = book.getName();
        if (bookRepository.findByName(name).isPresent()) {
            throw new AlreadyExistException(BOOK, "name", name);
        }
        BookModel bookModel = bookModelMapper.objectToModel(book);
        return bookRepository.save(bookModel).getId();
    }

    @Transactional
    public void update(Book book) {
        validate(book);
        Long bookId = book.getId();
        String imageId = bookRepository.findById(bookId)
                .map(BookModel::getImage)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        book.setImage(imageId);
        BookModel bookModel = bookModelMapper.objectToModel(book);
        bookRepository.save(bookModel);
    }

    @Transactional
    public void delete(Long bookId) {
        bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        bookRepository.deleteById(bookId);
    }

    public void addImageToBook(String imageId, Long bookId) {
        BookModel bookModel = bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        bookModel.setImage(imageId);
        bookRepository.save(bookModel);
    }

    public void removeImageFromBook(Long bookId) {
        BookModel bookModel = bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        bookModel.setImage(null);
        bookRepository.save(bookModel);
    }

    public void removeImage(String imageId) {
        List<BookModel> bookModels = bookRepository.findBookModelsByImage(imageId).stream()
                .peek(book -> book.setImage(null))
                .toList();
        bookRepository.saveAll(bookModels);
    }

    private void validate(Book book) {
        int count = book.getCount();
        if (count < 0) {
            throw new ValidationException(BOOK, "count", count);
        }
        String name = book.getName();
        if (name == null || name.isBlank()) {
            throw new ValidationException(BOOK, "name", name);
        }
        double price = book.getPrice();
        if (price < 0) {
            throw new ValidationException(BOOK, "price", price);
        }
    }

    private void runIndexing(SearchSession searchSession) {
        MassIndexer indexer = searchSession.massIndexer(BookModel.class )
                .threadsToLoadObjects(INDEXER_THREADS);
        try {
            indexer.startAndWait();
        } catch (InterruptedException e) {
            throw new InterruptedIndexerException();
        }
    }

    public BookFilterDefaultsDto getFilterDefaults() {
        return BookFilterDefaultsDto.builder()
                .dateOfBirthMin(authorService.getMinDateOfBirth().toString())
                .dateOfBirthMax(authorService.getMaxDateOfBirth().toString())
                .build();
    }
}