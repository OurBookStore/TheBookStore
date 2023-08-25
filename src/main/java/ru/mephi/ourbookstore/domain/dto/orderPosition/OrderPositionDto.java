package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionDto {
    Long id;
    BookDto bookDto;
    OrderDto orderDto;
    int count;
    double price;
}
