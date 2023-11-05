package ru.mephi.ourbookstore.domain.dto.orderStatusHistory;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatus;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistory {

    Long id;
    OrderModel order;
    OrderStatus status;
    Date date;
    boolean isActual;
}
