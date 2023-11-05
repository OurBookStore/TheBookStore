package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.*;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionAddToCartDto {

    Long orderPositionId;
    Long cartId;
}
