package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Bushueva Valery
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDto {
    Long id;
    LocalDateTime createdDate;
    List<OrderPositionDto> booksInOrder;
    Long customerId;
}
