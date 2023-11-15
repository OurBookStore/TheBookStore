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

    NOT_FOUND(HttpStatus.NOT_FOUND, "The %s with %s = %s not found!"),
    ALREADY_EXISTS(HttpStatus.CONFLICT, "The %s with %s = %s already exist!"),
    INCORRECT_COUNT(HttpStatus.CONFLICT, "The number of %s is not enough!\nThe request of %s = %s impossible to form!"),
    VALIDATION_ERROR(HttpStatus.BAD_REQUEST, "Validation for %s of field %s = %s error!"),
    KEYCLOAK_REQUEST_ERROR(HttpStatus.CONFLICT, "Keycloak error"),
    SAVE_ERROR(HttpStatus.BAD_REQUEST, "Error while saving an %s with id = %d"),
    READ_ERROR(HttpStatus.BAD_REQUEST, "Error while reading an %s with id = %d");

    final String message;
    final HttpStatus code;

    BookStoreError(HttpStatus code, String message) {
        this.message = message;
        this.code = code;
    }
}
