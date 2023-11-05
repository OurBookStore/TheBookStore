package ru.mephi.ourbookstore.domain.dto.appUser;

import lombok.*;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUserUpdateDto {

    Long id;
    String nickname;
    String email;
    String password;
}
