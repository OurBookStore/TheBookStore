package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

public class NoActualStatusException extends BookStoreException{

    public NoActualStatusException(String fieldName, Object fieldValue) {
        super(BookStoreError.NO_ACTUAL_STATUS, Entities.ORDER, fieldName, fieldValue);
    }
}
