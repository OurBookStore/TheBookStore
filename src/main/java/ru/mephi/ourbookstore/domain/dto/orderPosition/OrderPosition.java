package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.order.Order;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPosition {

    Long id;
    Book book;
    Order order;
    int count;
    double price;
    Cart cart;
}
