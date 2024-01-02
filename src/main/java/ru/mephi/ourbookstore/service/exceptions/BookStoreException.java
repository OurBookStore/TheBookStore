package ru.mephi.ourbookstore.service.exceptions;

import org.springframework.web.server.ResponseStatusException;
import ru.mephi.ourbookstore.domain.Entities;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookStoreException extends ResponseStatusException {

    public BookStoreException(BookStoreError error, Entities entity, String fieldName, Object fieldValue) {
        super(error.getCode(), String.format(error.getMessage(), entity, fieldName, fieldValue));
    }

    public BookStoreException(BookStoreError error, String message) {
        super(error.getCode(), message);
    }
}
