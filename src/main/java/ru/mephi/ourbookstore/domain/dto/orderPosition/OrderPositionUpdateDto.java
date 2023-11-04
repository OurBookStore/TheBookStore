package ru.mephi.ourbookstore.domain.dto.orderPosition;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionUpdateDto {

    Long id;
    int count;
}
