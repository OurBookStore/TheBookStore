package ru.mephi.ourbookstore.controller.cart;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.cart.CartDto;
import ru.mephi.ourbookstore.mapper.cart.CartDtoMapper;
import ru.mephi.ourbookstore.service.cart.CartService;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@RestController
@RequestMapping("/carts")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartController {

    final CartService cartService;
    final CartDtoMapper mapper;

    @GetMapping("/{cartId}")
    public CartDto getById(@PathVariable Long cartId) {
        Cart cart = cartService.getById(cartId);
        return mapper.objectToDto(cart);
    }

    @GetMapping("/app-user/{appUserId}")
    public CartDto getByAppUserId(@PathVariable Long appUserId) {
        Cart cart = cartService.getByAppUserId(appUserId);
        return mapper.objectToDto(cart);
    }
}
