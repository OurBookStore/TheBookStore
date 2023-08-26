package ru.mephi.ourbookstore.domain.dto.author;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;


@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorDto {
    String id;
    String fullName;
    String dateOfBirth;
    String country;
}
