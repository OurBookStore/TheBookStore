package ru.mephi.ourbookstore.service.book.exceptions;

import ru.mephi.ourbookstore.service.exceptions.BookStoreError;
import ru.mephi.ourbookstore.service.exceptions.BookStoreException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookAlreadyExistException extends BookStoreException {
    public BookAlreadyExistException(String bookName) {
        super(BookStoreError.ALREADY_EXISTS, "book", bookName);
    }
}
