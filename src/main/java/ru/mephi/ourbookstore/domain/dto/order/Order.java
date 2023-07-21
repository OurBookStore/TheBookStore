package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

/**
 * @author Bushueva Valery
 */
@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Order {
    UUID id = UUID.randomUUID();
    LocalDateTime createdDateTime;
    List<OrderPosition> booksInOrder;
    Long customerId;

}

