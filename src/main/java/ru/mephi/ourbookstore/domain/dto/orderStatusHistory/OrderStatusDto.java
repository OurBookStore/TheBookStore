package ru.mephi.ourbookstore.domain.dto.orderStatusHistory;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderStatus;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusDto {
    OrderStatus orderStatus;
}
