package ru.mephi.ourbookstore.domain.dto.order;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;

/**
 * @author Bushueva Valery
 */

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionDto {
    Long id;
    BookDto book;
    int count;
    OrderDto order;

}
