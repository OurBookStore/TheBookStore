package ru.mephi.ourbookstore.domain.dto.author;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.Date;

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorCreateDto {

    String fullName;
    String dateOfBirth;
    String country;
}
