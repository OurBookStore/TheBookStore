package ru.mephi.ourbookstore.domain.dto.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionOfOrderDto;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistoryDto;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDto {

    Long id;
    @JsonProperty(value = "appUser")
    AppUserDto appUserDto;
    List<OrderPositionOfOrderDto> orderPositions;
    List<OrderStatusHistoryDto> orderStatusHistories;
    String address;
    double totalPrice;
}
