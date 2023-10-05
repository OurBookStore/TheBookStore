package ru.mephi.ourbookstore.service.exceptions;


public class NotFoundUserException extends RuntimeException{

    public NotFoundUserException(String errorMessage){
        super(String.format(BookStoreLocalError.NO_FOUND_USER_EXCEPTION.getMessage(),errorMessage));
    }
}
