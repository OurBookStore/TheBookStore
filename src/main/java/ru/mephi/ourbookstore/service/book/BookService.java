package ru.mephi.ourbookstore.service.book;

import java.util.List;

import javax.persistence.EntityManager;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
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

    final int SEARCH_MAX_DISTANCE = 2;

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
        Query fuzzyQuery = getQueryBuilder()
                .keyword()
                .fuzzy()
                .withEditDistanceUpTo(SEARCH_MAX_DISTANCE)
                .onFields("name", "authors.fullName")
                .matching(searchText)
                .createQuery();

        return getJpaQuery(fuzzyQuery).getResultList();
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

    private FullTextQuery getJpaQuery(org.apache.lucene.search.Query luceneQuery) {
        return Search.getFullTextEntityManager(entityManager)
                .createFullTextQuery(luceneQuery, Book.class);
    }

    private QueryBuilder getQueryBuilder() {
        return Search.getFullTextEntityManager(entityManager)
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(Book.class)
                .get();
    }
}