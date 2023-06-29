package ru.mephi.ourbookstore.service.exceptions;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum BookStoreError {

    NOT_FOUND(HttpStatus.NOT_FOUND, "The %s with id = %s not found!"),
    ALREADY_EXISTS(HttpStatus.CONFLICT, "The %s with id = %s already exist!"),
    VALIDATION_ERROR(HttpStatus.BAD_REQUEST, "Validation for %s of field %s error!");

    final String message;
    final HttpStatus code;

    BookStoreError(HttpStatus code, String message) {
        this.message = message;
        this.code = code;
    }
}
