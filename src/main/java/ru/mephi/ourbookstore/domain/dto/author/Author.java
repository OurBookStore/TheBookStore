package ru.mephi.ourbookstore.domain.dto.author;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Author {
    Long id;
    String fullName;
    String dateOfBirth;
    String country;

}