package ru.mephi.ourbookstore.service.book;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.mapper.book.BookModelMapper;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.service.exceptions.book.BookAlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.book.BookNotFoundException;
import ru.mephi.ourbookstore.service.exceptions.book.BookValidationException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookService {

    final BookRepository bookRepository;
    final BookModelMapper bookModelMapper;

    public Book getById(long bookId) {
        BookModel bookModel = bookRepository.findById(bookId)
                .orElseThrow(() -> new BookNotFoundException(bookId));
        return bookModelMapper.modelToObject(bookModel);
    }

    public List<Book> getAll() {
        return bookRepository.findAll().stream()
                .map(bookModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public void create(Book book) {
        validate(book);
        String name = book.getName();
        if (bookRepository.findByName(name).isPresent()) {
            throw new BookAlreadyExistException(name);
        }
        BookModel bookModel = bookModelMapper.objectToModel(book);
        bookRepository.save(bookModel);
    }

    @Transactional
    public void update(Book book) {
        validate(book);
        long bookId = book.getId();
        bookRepository.findById(bookId)
                .orElseThrow(() -> new BookNotFoundException(bookId));
        BookModel bookModel = bookModelMapper.objectToModel(book);
        bookRepository.save(bookModel);
    }

    @Transactional
    public void delete(Long bookId) {
        bookRepository.findById(bookId)
                .orElseThrow(() -> new BookNotFoundException(bookId));
        bookRepository.deleteById(bookId);
    }

    private void validate(Book book) {
        if (book.getCount() < 0) {
            throw new BookValidationException("count");
        }
        if (book.getName() == null || book.getName().isBlank()) {
            throw new BookValidationException("name");
        }
        if (book.getPrice() < 0) {
            throw new BookValidationException("price");
        }
    }
}
