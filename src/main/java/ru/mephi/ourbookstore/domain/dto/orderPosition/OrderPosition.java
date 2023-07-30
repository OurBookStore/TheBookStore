package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.OrderModel;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPosition {

    Long id;
    BookModel book;
    OrderModel order;
    int count;
    double price;
}
