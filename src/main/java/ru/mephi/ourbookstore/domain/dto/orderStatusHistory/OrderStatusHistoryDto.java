package ru.mephi.ourbookstore.domain.dto.orderStatusHistory;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistoryDto {
    Long id;
    Long orderId;
    String status;
    LocalDateTime actualFrom;
    boolean actualFlag;
}
