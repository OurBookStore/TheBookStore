package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionDto;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDto {

    Long id;
    AppUserDto appUser;
    List<OrderPositionDto> orderPositions;
    String address;
    double totalPrice;
}
