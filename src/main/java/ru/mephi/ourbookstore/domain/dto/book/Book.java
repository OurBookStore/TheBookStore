package ru.mephi.ourbookstore.domain.dto.book;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderPositionModel;

import java.util.List;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Book {
    Long id;
    String name;
    double price;
    int count;
    List<OrderPositionModel> orderPositions;
}
