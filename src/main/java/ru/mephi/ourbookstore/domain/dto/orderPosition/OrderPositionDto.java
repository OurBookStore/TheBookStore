package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionDto {
    Long id;
    BookDto bookDto;
    Long orderId;
    int count;
    double price;
}
