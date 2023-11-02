package ru.mephi.ourbookstore.domain.dto.appUser;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;

import java.util.List;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUser {

    Long id;
    String nickname;
    String email;
    String password;
    List<OrderModel> orders;
    Cart cart;
}
