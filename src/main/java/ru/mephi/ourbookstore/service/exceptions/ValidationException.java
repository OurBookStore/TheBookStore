package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class ValidationException extends BookStoreException {
    public ValidationException(Entities entity, String fieldName, Object fieldValue) {
        super(BookStoreError.VALIDATION_ERROR, entity, fieldName, fieldValue);
    }
}