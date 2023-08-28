package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

public class BookCountException extends BookStoreException {

    public BookCountException(String fieldName, Object fieldValue) {
        super(BookStoreError.INCORRECT_COUNT, Entities.BOOK, fieldName, fieldValue);
    }
}
