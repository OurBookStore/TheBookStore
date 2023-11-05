package ru.mephi.ourbookstore.domain.dto.cart;

import java.util.List;

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
public class CartUpdateDto {

    Long id;
    List<Long> orderPositionIds;
}
