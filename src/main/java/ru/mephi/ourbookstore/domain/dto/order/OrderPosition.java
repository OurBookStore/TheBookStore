package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.Book;


/**
 * @author Bushueva Valery
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPosition {
    Long id;
    Book book;
    int count;
    Order order;
}

//get price of it all
