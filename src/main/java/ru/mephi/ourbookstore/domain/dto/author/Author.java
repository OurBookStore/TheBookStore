package ru.mephi.ourbookstore.domain.dto.author;

import java.util.List;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.Book;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Author {
    Long id;
    String fullName;
    String dateOfBirth;
    String country;
    List<Book> books;
}