package ru.mephi.ourbookstore.domain.dto.author;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorUpdateDto {
    String id;
    String fullName;
    String country;
    String dateOfBirth;
}