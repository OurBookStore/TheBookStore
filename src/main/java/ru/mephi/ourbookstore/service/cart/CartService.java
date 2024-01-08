package ru.mephi.ourbookstore.service.cart;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.order.OrderPreviewDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionPreviewDto;
import ru.mephi.ourbookstore.mapper.book.BookDtoMapper;
import ru.mephi.ourbookstore.mapper.book.BookModelMapper;
import ru.mephi.ourbookstore.mapper.cart.CartModelMapper;
import ru.mephi.ourbookstore.repository.cart.CartRepository;
import ru.mephi.ourbookstore.repository.orderPosition.OrderPositionRepository;
import ru.mephi.ourbookstore.service.appUser.AppUserService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static ru.mephi.ourbookstore.domain.Entities.CART;
import static ru.mephi.ourbookstore.util.Utils.distinctByKey;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartService {

    final CartRepository cartRepository;
    final OrderPositionRepository orderPositionRepository;
    final AppUserService appUserService;
    final CartModelMapper cartMapper;
    final BookDtoMapper bookDtoMapper;
    final BookModelMapper bookModelMapper;

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
        AppUser appUser = appUserService.getById(appUserId);
        List<OrderPositionModel> positionModelList = orderPositionRepository.findAllByCartId(appUser.getCart().getId());
        Map<Long, Integer> bookCountDictionary = positionModelList.stream().collect(
                Collectors.groupingBy(orderPosition -> orderPosition.getBook().getId(), Collectors.summingInt(OrderPositionModel::getCount))
        );
        List<OrderPositionPreviewDto> orderPreviewPositions = positionModelList
                .stream()
                .filter(distinctByKey(orderPosition -> orderPosition.getBook().getId())) //Удаляет дубликаты
                .map(orderPosition -> OrderPositionModel.builder() //меняем у уникальных позиций количтсва
                        .id(orderPosition.getId())
                        .count(bookCountDictionary.get(orderPosition.getBook().getId()))
                        .price(bookCountDictionary.get(orderPosition.getBook().getId()) * orderPosition.getBook().getPrice())
                        .book(orderPosition.getBook())
                        .order(orderPosition.getOrder())
                        .build())
                .filter(orderPosition -> orderPosition.getBook().getCount() != 0) //Фильтр на ошибки
                .map(this::handleCartPosition) //Проверяем переполнение по количству книг
                .map(orderPosition -> OrderPositionPreviewDto.builder() //Мапим в dto
                        .bookDto(bookDtoMapper.objectToDto(bookModelMapper.modelToObject(orderPosition.getBook())))
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

    private OrderPositionModel handleCartPosition(OrderPositionModel orderPosition) {
        if (orderPosition.getBook().getCount() <= orderPosition.getCount()) {
            orderPosition.setCount(orderPosition.getBook().getCount());
            orderPosition.setPrice(orderPosition.getCount() * orderPosition.getBook().getPrice());
        }
        return orderPosition;
    }
}
