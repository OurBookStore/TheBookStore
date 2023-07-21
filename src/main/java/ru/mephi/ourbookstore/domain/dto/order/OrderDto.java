package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerDto;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

/**
 * @author Bushueva Valery
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDto {
    UUID id;
    LocalDateTime createdDateTime;
    List<OrderPositionDto> booksInOrder;
    Long customerId;
}
