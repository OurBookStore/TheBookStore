package ru.mephi.ourbookstore.service.exceptions.keyclaok;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

public class KeycloakIntegrationException extends ResponseStatusException {

    public KeycloakIntegrationException() {
        super(HttpStatus.SERVICE_UNAVAILABLE, BookStoreKeycloakError
                .KEYCLOAK_INTEGRATION_ERROR
                .getMessage());
    }

    public KeycloakIntegrationException(String errorMessage) {
        super(HttpStatus.SERVICE_UNAVAILABLE, String.format(BookStoreKeycloakError.KEYCLOAK_INTEGRATION_EXCEPTION.getMessage(), errorMessage));
    }

    public KeycloakIntegrationException(String errorMessage, Throwable throwable) {
        super(HttpStatus.SERVICE_UNAVAILABLE, String.format(BookStoreKeycloakError.KEYCLOAK_INTEGRATION_EXCEPTION.getMessage(), errorMessage), throwable);
    }
}
