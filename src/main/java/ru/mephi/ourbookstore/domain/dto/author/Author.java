package ru.mephi.ourbookstore.domain.dto.author;

import lombok.*;
import lombok.experimental.FieldDefaults;

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

}