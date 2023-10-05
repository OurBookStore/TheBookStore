package ru.mephi.ourbookstore.service.exceptions;


import ru.mephi.ourbookstore.domain.dto.keyCloak.AuthRequest;
import ru.mephi.ourbookstore.domain.dto.keyCloak.UserClientRequest;

public class InvalidRequestException extends RuntimeException{

    public InvalidRequestException(AuthRequest authRequest){
        super(String.format(BookStoreLocalError.INVALID_LOGIN_EXCEPTION.getMessage(),
                authRequest.getUsername(),
                authRequest.getPassword()
                )
        );
    }
    public InvalidRequestException(UserClientRequest userClientRequest){
        super(String.format(BookStoreLocalError.KEYCLOAK_REGISTRATION_EXCEPTION.getMessage(),
                        userClientRequest.getUsername(),
                        userClientRequest.getEmail()
                )
        );
    }
}
