package ru.mephi.ourbookstore.service.exceptions;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum BookStoreLocalError {

    TECHNICAL_ERROR("A technical error has occurred."),
    NO_FOUND_ROLE_EXCEPTION("This role with name [%s] not found"),
    NO_FOUND_USER_EXCEPTION("This user with id [%s] not found"),
    KEYCLOAK_INTEGRATION_EXCEPTION("Keycloak failed for the following reason: %s"),
    INVALID_LOGIN_EXCEPTION("Incorrect authorization fields were entered: [login = %s, pass = %s]"),
    KEYCLOAK_REGISTRATION_EXCEPTION("User already exists: [username = %s, email = %s]"),
    INVALID_REFRESH_TOKEN_EXCEPTION("Incorrect refresh token : [refresh = %s ]"),
    KEYCLOAK_INTEGRATION_ERROR("Error getting data from the keyclock"),
    VALIDATION_ERROR("Request validation error.");

    private final String message;

    BookStoreLocalError(final String message) {
        this.message = message;
    }

}
