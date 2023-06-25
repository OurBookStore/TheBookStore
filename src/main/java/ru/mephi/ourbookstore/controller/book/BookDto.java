package ru.mephi.ourbookstore.controller.book;

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
public class BookDto {

    long id;
    String name;
    double price;
    int count;
}
