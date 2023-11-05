package ru.mephi.ourbookstore.service.exceptions.keyclaok;


import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;
import ru.mephi.ourbookstore.domain.dto.keyCloak.AuthRequest;
import ru.mephi.ourbookstore.domain.dto.keyCloak.UserClientRequest;

public class InvalidRequestException extends ResponseStatusException {

    public InvalidRequestException(AuthRequest authRequest) {
        super(HttpStatus.BAD_REQUEST, String.format(BookStoreKeycloakError.INVALID_LOGIN_EXCEPTION.getMessage(),
                        authRequest.getUsername(),
                        authRequest.getPassword()
                )
        );
    }

    public InvalidRequestException(UserClientRequest userClientRequest, BookStoreKeycloakError bookStoreKeycloakError) {
        super(HttpStatus.CONFLICT, String.format(bookStoreKeycloakError.getMessage(),
                        userClientRequest.getUsername(),
                        userClientRequest.getEmail()
                )
        );
    }

    public InvalidRequestException(String refreshToken) {
        super(HttpStatus.CONFLICT, String.format(BookStoreKeycloakError.INVALID_REFRESH_TOKEN_EXCEPTION.getMessage(),
                        refreshToken
                )
        );
    }
}
