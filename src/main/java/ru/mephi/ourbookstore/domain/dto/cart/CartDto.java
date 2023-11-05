package ru.mephi.ourbookstore.domain.dto.cart;

import java.util.List;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartDto {

    Long id;
    List<OrderPositionDto> orderPositions;
}
