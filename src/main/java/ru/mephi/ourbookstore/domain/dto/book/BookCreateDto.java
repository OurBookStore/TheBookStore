package ru.mephi.ourbookstore.domain.dto.book;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookCreateDto {

    String name;
    double price;
    int count;
}
