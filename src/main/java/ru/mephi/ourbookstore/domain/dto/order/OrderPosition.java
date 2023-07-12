package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;



/**
 * @author Bushueva Valery
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPosition {
    Long id;
    Long bookId;
    int count;
    Order order;
}

//get price of it all
