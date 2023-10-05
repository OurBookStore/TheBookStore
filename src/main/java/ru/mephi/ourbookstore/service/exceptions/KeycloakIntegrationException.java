package ru.mephi.ourbookstore.service.exceptions;

public class KeycloakIntegrationException extends RuntimeException{

    public KeycloakIntegrationException(){
        super(BookStoreLocalError
                .KEYCLOAK_INTEGRATION_ERROR
                .getMessage());
    }

    public KeycloakIntegrationException(String errorMessage){
        super(String.format(BookStoreLocalError.KEYCLOAK_INTEGRATION_EXCEPTION.getMessage(),errorMessage));
    }
}
