package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class NotFoundException extends BookStoreException {

    public NotFoundException(Entities entity, String fieldName, Object fieldValue) {
        super(BookStoreError.NOT_FOUND, entity, fieldName, fieldValue);
    }
}