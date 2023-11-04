package ru.mephi.ourbookstore.domain.dto.order;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Order {

    Long id;
    AppUser appUser;
    List<OrderPosition> orderPositions;
    String address;
    double totalPrice;
}
