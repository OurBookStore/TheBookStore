package ru.mephi.ourbookstore.controller.order;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderUpdateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionLink;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusDto;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistoryDto;
import ru.mephi.ourbookstore.mapper.order.OrderDtoMapper;
import ru.mephi.ourbookstore.mapper.orderStatusHistory.OrderStatusHistoryDtoMapper;
import ru.mephi.ourbookstore.service.order.OrderService;
import ru.mephi.ourbookstore.service.orderPosition.OrderPositionService;

import java.util.List;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@SecurityRequirement(name = "bearerAuth")
public class OrderController {

    final OrderService orderService;
    final OrderPositionService orderPositionService;
    final OrderDtoMapper orderDtoMapper;
    final OrderStatusHistoryDtoMapper oshDtoMapper;


    @GetMapping("/{orderId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER',#orderId)")
    public OrderDto getOrderById(@PathVariable Long orderId) {
        return orderDtoMapper.objectToDto(orderService.getById(orderId));
    }

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public List<OrderDto> getAll() {
        return orderService.getAll().stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }

    @GetMapping("/appUsers/{appUserId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#appUserId)")
    public List<OrderDto> getAllByAppUser(@PathVariable Long appUserId) {
        return orderService.getAll(appUserId).stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#orderDto.appUserId)")
    public Long createOrder(@RequestBody OrderCreateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.create(order);
    }

    @PutMapping("/{orderId}/carts/{cartId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER',#orderId) and @appUserAuthService.checkPermission('CART',#cartId)")
    public Long fillOrderByCartPositions(@PathVariable Long orderId, @PathVariable Long cartId) {
        return orderPositionService.fillOrderByCartPositions(orderId, cartId);
    }

    @PutMapping
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER',#orderDto.id)")
    public Long updateOrder(@RequestBody OrderUpdateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.update(order);
    }

    @PutMapping("/{orderId}")
    @PreAuthorize("hasRole('ADMIN')")
    public Long updateStatus(@PathVariable Long orderId, @RequestBody OrderStatusDto orderStatusDto) {
        return orderService.updateOrderStatus(orderId, orderStatusDto.getOrderStatus());
    }

    @GetMapping("/{orderId}/actual-status")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER',#orderId)")
    public OrderStatusHistoryDto getActualStatus(@PathVariable Long orderId) {
        return oshDtoMapper.objectToDto(orderService.getActualStatus(orderId));
    }

    @DeleteMapping("/{orderId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER',#orderId)")
    public void deleteOrder(@PathVariable Long orderId) {
        orderService.delete(orderId);
    }

    @PostMapping("/{orderId}/positions/{orderPositionId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER',#orderId) and @appUserAuthService.checkPermission('ORDER_POSITION',#orderPositionId)")
    public Long createPositionLink(@PathVariable Long orderId, @PathVariable Long orderPositionId) {
        return orderPositionService.createLinkToOrder(new OrderPositionLink(orderId, orderPositionId));
    }

}
