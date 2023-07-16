package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderUpdateDto {
    Long id;
    List<OrderPositionUpdateDto> booksInOrder;
}
