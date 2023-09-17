package ru.mephi.ourbookstore.service.book;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.mapper.book.BookModelMapper;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.domain.BookModel;
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