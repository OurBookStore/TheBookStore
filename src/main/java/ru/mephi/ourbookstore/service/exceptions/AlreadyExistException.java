package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class AlreadyExistException extends BookStoreException {

    public AlreadyExistException(Entities entity, String fieldName, Object fieldValue) {
        super(BookStoreError.ALREADY_EXISTS, entity, fieldName, fieldValue);
    }
}
