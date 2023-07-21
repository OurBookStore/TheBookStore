package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import java.util.UUID;


/**
 * @author Bushueva Valery
 */

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionDto {
    UUID id;
    Long bookId;
    int count;
    UUID orderId;
}
