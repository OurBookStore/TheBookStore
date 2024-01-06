package ru.mephi.ourbookstore.domain.dto.book;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookSearchRqDto {
    String searchText;
    int pageNumber;
    int bookPerPage;
    String dateOfBirthFrom;
    String dateOfBirthTo;
}
