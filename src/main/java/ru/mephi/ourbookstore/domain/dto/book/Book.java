package ru.mephi.ourbookstore.domain.dto.book;

import java.util.List;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;

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
    List<OrderPosition> orderPositions;
    List<Author> authors;
}
