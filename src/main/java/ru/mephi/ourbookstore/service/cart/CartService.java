package ru.mephi.ourbookstore.service.cart;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.mapper.cart.CartModelMapper;
import ru.mephi.ourbookstore.repository.cart.CartRepository;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;

import static ru.mephi.ourbookstore.domain.Entities.CART;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartService {

    final CartRepository cartRepository;
    final CartModelMapper cartMapper;

    public Cart getById(Long cartId) {
        return cartRepository.findById(cartId)
                .map(cartMapper::modelToObject)
                .orElseThrow(() -> new NotFoundException(CART, "id", cartId));
    }

    public Cart getByAppUserId(Long appUserId) {
        return cartRepository.findCartModelByAppUserId(appUserId)
                .map(cartMapper::modelToObject)
                .orElseThrow(() -> new NotFoundException(CART, "appUserId", appUserId));
    }
}
