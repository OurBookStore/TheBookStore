package ru.mephi.ourbookstore.domain.dto.orderStatusHistory;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.dto.order.Order;

import java.time.LocalDateTime;


@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistory {

    Long id;
    Order order;
    OrderStatus status;
    LocalDateTime effectiveFrom;
    boolean isActual;

    public OrderStatusHistory(Order order, OrderStatus orderStatus) {
        this(null, order, orderStatus, LocalDateTime.now(), true);
    }
}
