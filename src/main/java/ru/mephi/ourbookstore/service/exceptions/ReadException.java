package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class ReadException extends BookStoreException {

    public ReadException(Entities entity, String fieldName, Object fieldValue) {
        super(BookStoreError.READ_ERROR, entity, fieldName, fieldValue);
    }
}
