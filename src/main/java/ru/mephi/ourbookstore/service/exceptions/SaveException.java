package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.Entities;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class SaveException extends BookStoreException {

    public SaveException(Entities entity, String fieldName, Object fieldValue) {
        super(BookStoreError.SAVE_ERROR, entity, fieldName, fieldValue);
    }
}
