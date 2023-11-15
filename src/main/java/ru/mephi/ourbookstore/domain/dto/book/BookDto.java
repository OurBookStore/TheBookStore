package ru.mephi.ourbookstore.domain.dto.book;

import java.util.List;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookDto {

    Long id;
    String name;
    double price;
    int count;
    String image;
    List<AuthorDto> authors;
}
