package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.OrderModel;

import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPosition {

    UUID uuid;
    BookModel book;
    OrderModel order;
    int count;
    double price;
    double taxShare;
}
