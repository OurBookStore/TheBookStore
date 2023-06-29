package ru.mephi.ourbookstore.service.exceptions.book;

import ru.mephi.ourbookstore.service.exceptions.BookStoreError;
import ru.mephi.ourbookstore.service.exceptions.BookStoreException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookNotFoundException extends BookStoreException {
    public BookNotFoundException(long bookId) {
        super(BookStoreError.NOT_FOUND, "book", Long.toString(bookId));
    }
}