package ru.mephi.ourbookstore.domain.dto.book;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookFilterDefaultsDto {
    String dateOfBirthMin;
    String dateOfBirthMax;
}
