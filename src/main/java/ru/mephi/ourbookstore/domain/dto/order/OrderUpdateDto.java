package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.UUID;

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderUpdateDto {
    UUID id;
    List<OrderPositionUpdateDto> booksInOrder;
    Long customerId;
}
