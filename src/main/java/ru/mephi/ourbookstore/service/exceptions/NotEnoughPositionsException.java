package ru.mephi.ourbookstore.service.exceptions;

import ru.mephi.ourbookstore.domain.dto.order.OrderPosition;

public class NotEnoughPositionsException extends Exception {
    public NotEnoughPositionsException(OrderPosition position, int count) {
        super(String.format("Not enough positions are available for id = %s, requested %d units, " +
                "but %d only available", position.getBookId(), position.getCount(), count));
    }
}
