package ru.mephi.ourbookstore.service.exceptions;

import org.springframework.http.HttpStatusCode;
import org.springframework.web.client.HttpClientErrorException;

public class OrderCreationException extends HttpClientErrorException {

    public OrderCreationException(HttpStatusCode statusCode, String statusText) {
        super(statusCode, statusText);
    }
}
