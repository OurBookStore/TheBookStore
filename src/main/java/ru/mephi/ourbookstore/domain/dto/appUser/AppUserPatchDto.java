package ru.mephi.ourbookstore.domain.dto.appUser;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUserPatchDto {

    Long id;
    String address;
}
