package ru.mephi.ourbookstore.domain.dto.author;

import java.util.List;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorDto {
    String id;
    String fullName;
    String dateOfBirth;
    String country;
    List<BookDto> books;
}
