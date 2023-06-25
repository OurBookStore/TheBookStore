package ru.mephi.ourbookstore.service.book;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Book {
    long id;
    String name;
    double price;
    int count;
}
