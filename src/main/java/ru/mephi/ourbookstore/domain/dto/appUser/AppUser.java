package ru.mephi.ourbookstore.domain.dto.appUser;

import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderModel;

import java.util.List;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUser {

    Long id;
    String nickname;
    String email;
    String password;
    String keycloakId;
    List<OrderModel> orders;
}
