package ru.mephi.ourbookstore.domain.dto.orderPosition;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionDto {

    Long id;
    @JsonProperty(value = "book")
    BookDto bookDto;
    Long orderId;
    int count;
    double price;
}
