package ru.mephi.ourbookstore.domain.dto.appUser;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUserCreateDto {

    String nickname;
    String email;
    String password;
}
