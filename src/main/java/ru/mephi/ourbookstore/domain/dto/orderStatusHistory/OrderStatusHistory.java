package ru.mephi.ourbookstore.domain.dto.orderStatusHistory;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.dto.order.Order;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistory {

    Long id;
    Order order;
    OrderStatus status;
    LocalDateTime actualFrom;
    boolean actualFlag;
}
