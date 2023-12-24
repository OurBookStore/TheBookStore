package ru.mephi.ourbookstore.domain.dto.order;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionPreviewDto;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPreviewDto {

    Double totalPrice;
    String address;
    List<OrderPositionPreviewDto> orderPositions;

}
