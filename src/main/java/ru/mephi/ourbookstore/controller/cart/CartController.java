package ru.mephi.ourbookstore.controller.cart;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.cart.CartDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderPreviewDto;
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
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('CART',#cartId)")
    public CartDto getById(@PathVariable Long cartId) {
        Cart cart = cartService.getById(cartId);
        return mapper.objectToDto(cart);
    }

    @GetMapping("/app-user/{appUserId}")
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#appUserId)")
    public CartDto getByAppUserId(@PathVariable Long appUserId) {
        Cart cart = cartService.getByAppUserId(appUserId);
        return mapper.objectToDto(cart);
    }

    @GetMapping("/preview/{appUserId}")
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#appUserId)")
    public OrderPreviewDto getPreviewOrder(@PathVariable Long appUserId) {
        return cartService.getOrderPreview(appUserId);
    }
}
