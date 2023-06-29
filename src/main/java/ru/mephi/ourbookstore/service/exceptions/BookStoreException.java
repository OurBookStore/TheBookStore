package ru.mephi.ourbookstore.service.exceptions;

import org.springframework.web.server.ResponseStatusException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookStoreException extends ResponseStatusException {

    public BookStoreException(BookStoreError error, String entity, String value) {
        super(error.getCode(), String.format(error.getMessage(), entity, value));
    }
}
