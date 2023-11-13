package ru.mephi.ourbookstore.domain.dto.book;

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
public class BookUpdateDto {

    Long id;
    String name;
    double price;
    int count;
    Long authorId;
}
