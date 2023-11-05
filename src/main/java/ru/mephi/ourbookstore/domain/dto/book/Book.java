package ru.mephi.ourbookstore.domain.dto.book;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderPositionModel;

import java.util.List;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Book {
    Long id;
    String name;
    double price;
    int count;
    String image;
    List<OrderPositionModel> orderPositions;
}
