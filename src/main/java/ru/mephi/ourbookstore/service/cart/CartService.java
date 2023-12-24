package ru.mephi.ourbookstore.service.cart;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.order.OrderPreviewDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionPreviewDto;
import ru.mephi.ourbookstore.mapper.book.BookDtoMapper;
import ru.mephi.ourbookstore.mapper.cart.CartModelMapper;
import ru.mephi.ourbookstore.repository.cart.CartRepository;
import ru.mephi.ourbookstore.service.appUser.AppUserService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;

import java.util.List;
import java.util.stream.Collectors;

import static ru.mephi.ourbookstore.domain.Entities.CART;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartService {

    final CartRepository cartRepository;
    final AppUserService appUserService;
    final CartModelMapper cartMapper;
    final BookDtoMapper bookDtoMapper;

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

    public OrderPreviewDto getOrderPreview(Long appUserId) {
        Cart cart = getByAppUserId(appUserId);
        AppUser appUser = appUserService.getById(appUserId);
        List<OrderPositionPreviewDto> orderPreviewPositions = cart.getOrderPositions()
                .stream()
                .filter(orderPosition -> orderPosition.getBook().getCount() != 0)
                .map(this::handleCartPosition)
                .map(orderPosition -> OrderPositionPreviewDto.builder()
                        .bookDto(bookDtoMapper.objectToDto(orderPosition.getBook()))
                        .price(orderPosition.getPrice())
                        .count(orderPosition.getCount())
                        .build())
                .collect(Collectors.toList());

        return OrderPreviewDto.builder()
                .totalPrice(orderPreviewPositions.stream()
                        .mapToDouble(OrderPositionPreviewDto::getPrice)
                        .sum())
                .orderPositions(orderPreviewPositions)
                .address(appUser.getAddress())
                .build();
    }

    private OrderPosition handleCartPosition(OrderPosition orderPosition) {
        if (orderPosition.getBook().getCount() <= orderPosition.getCount()) {
            orderPosition.setCount(orderPosition.getBook().getCount());
            orderPosition.setPrice(orderPosition.getCount() * orderPosition.getBook().getPrice());
        }
        return orderPosition;
    }
}
