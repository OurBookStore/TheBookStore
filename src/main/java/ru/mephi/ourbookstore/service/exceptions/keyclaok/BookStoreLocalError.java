package ru.mephi.ourbookstore.service.exceptions.keyclaok;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum BookStoreLocalError {

    KEYCLOAK_INTEGRATION_EXCEPTION("Keycloak failed for the following reason: %s"),
    INVALID_LOGIN_EXCEPTION("Incorrect authorization fields were entered: [login = %s, pass = %s]"),
    KEYCLOAK_USER_CONFLICT_EXCEPTION("User already exists: [username = %s, email = %s]"),
    KEYCLOAK_USER_VALID_EXCEPTION("Validation: Invalid email: [username = %s, email = %s]"),
    INVALID_REFRESH_TOKEN_EXCEPTION("Incorrect refresh token : [refresh = %s ]"),
    KEYCLOAK_INTEGRATION_ERROR("Error getting data from the keyclock");

    private final String message;

    BookStoreLocalError(final String message) {
        this.message = message;
    }

}
