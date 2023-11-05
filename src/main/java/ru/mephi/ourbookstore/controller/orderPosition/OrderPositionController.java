package ru.mephi.ourbookstore.controller.orderPosition;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
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
@SecurityRequirement(name = "bearerAuth")
public class OrderPositionController {

    final OrderPositionService orderPositionService;
    final OrderPositionDtoMapper orderPositionDtoMapper;

    @PostMapping
    public Long create(@RequestBody OrderPositionCreateDto orderPositionCreateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        return orderPositionService.create(orderPosition);
    }

    @PutMapping
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#positionUpdateDto.id)")
    public Long update(@RequestBody OrderPositionUpdateDto positionUpdateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(positionUpdateDto);
        return orderPositionService.update(orderPosition);
    }

    @PostMapping("/carts")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('CART',#orderPositionAddToCartDto.cartId)")
    public void addToCart(
            @RequestBody OrderPositionAddToCartDto orderPositionAddToCartDto
    ) {
        orderPositionService.addToCart(
                orderPositionAddToCartDto.getOrderPositionId(),
                orderPositionAddToCartDto.getCartId()
        );
    }

    @DeleteMapping("/carts")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#orderPositionRemoveFromCartDto.orderPositionId)")
    public void removeFromCart(
            @RequestBody OrderPositionRemoveFromCartDto orderPositionRemoveFromCartDto
    ) {
        orderPositionService.removeFromCart(
                orderPositionRemoveFromCartDto.getOrderPositionId()
        );
    }

    @GetMapping("/{orderPositionId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#orderPositionId)")
    public OrderPositionDto get(@PathVariable Long orderPositionId) {
        return orderPositionDtoMapper.objectToDto(orderPositionService.getById(orderPositionId));
    }

    @DeleteMapping("/{orderPositionId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#orderPositionId)")
    public void delete(@PathVariable Long orderPositionId) {
        orderPositionService.delete(orderPositionId);
    }
}
