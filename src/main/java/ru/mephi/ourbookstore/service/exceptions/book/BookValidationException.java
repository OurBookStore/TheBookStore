package ru.mephi.ourbookstore.service.exceptions.book;

import ru.mephi.ourbookstore.service.exceptions.BookStoreError;
import ru.mephi.ourbookstore.service.exceptions.BookStoreException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookValidationException extends BookStoreException {
    public BookValidationException(String field) {
        super(BookStoreError.VALIDATION_ERROR, "book", field);
    }
}