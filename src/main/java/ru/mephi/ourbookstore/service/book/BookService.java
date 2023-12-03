package ru.mephi.ourbookstore.service.book;

import java.util.List;

import jakarta.persistence.EntityManager;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.hibernate.search.backend.elasticsearch.ElasticsearchExtension;
import org.hibernate.search.engine.search.query.SearchResult;
import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.mapper.book.BookModelMapper;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
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

    public List<Book> search(String searchText) {
        SearchSession searchSession = Search.session(entityManager);

        SearchResult<BookModel> result = searchSession.search(BookModel.class).extension(ElasticsearchExtension.get())
                .where(f -> f.simpleQueryString().fields("name","authors.name").matching(searchText)).fetch(100);

        return result.hits().stream()
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
        bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
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
}