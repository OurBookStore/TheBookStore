package ru.mephi.ourbookstore.controller.orderPosition;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionRemoveFromCartDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionUpdateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionAddToCartDto;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionDtoMapper;
import ru.mephi.ourbookstore.service.orderPosition.OrderPositionService;

@RestController
@RequestMapping("/positions")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionController {

    final OrderPositionService orderPositionService;
    final OrderPositionDtoMapper orderPositionDtoMapper;

    @PostMapping
    public Long create(@RequestBody OrderPositionCreateDto orderPositionCreateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        return orderPositionService.create(orderPosition);
    }

    @PutMapping
    public Long update(@RequestBody OrderPositionUpdateDto orderPositionCreateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        return orderPositionService.update(orderPosition);
    }

    @PostMapping("/carts")
    public void addToCart(
            @RequestBody OrderPositionAddToCartDto orderPositionAddToCartDto
    ) {
        orderPositionService.addToCart(
                orderPositionAddToCartDto.getOrderPositionId(),
                orderPositionAddToCartDto.getCartId()
        );
    }

    @DeleteMapping("/carts")
    public void removeFromCart(
            @RequestBody OrderPositionRemoveFromCartDto orderPositionRemoveFromCartDto
    ) {
        orderPositionService.removeFromCart(
                orderPositionRemoveFromCartDto.getOrderPositionId()
        );
    }

    @GetMapping("/{orderPositionId}")
    public OrderPositionDto get(@PathVariable Long orderPositionId) {
        return orderPositionDtoMapper.objectToDto(orderPositionService.getById(orderPositionId));
    }

    @DeleteMapping("/{orderPositionId}")
    public void delete(@PathVariable Long orderPositionId) {
        orderPositionService.delete(orderPositionId);
    }
}
