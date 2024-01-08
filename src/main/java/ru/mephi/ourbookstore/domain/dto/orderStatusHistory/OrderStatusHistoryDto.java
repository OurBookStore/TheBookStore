package ru.mephi.ourbookstore.domain.dto.orderStatusHistory;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
    @JsonFormat(pattern = "YYYY-MM-dd HH:mm")
    LocalDateTime actualFrom;
    boolean actualFlag;
}
