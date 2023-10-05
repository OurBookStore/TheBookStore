package ru.mephi.ourbookstore.controller.order;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderUpdateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionLink;
import ru.mephi.ourbookstore.mapper.order.OrderDtoMapper;
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

    @GetMapping("/{orderId}")
    public OrderDto getOrderById(@PathVariable Long orderId) {
        return orderDtoMapper.objectToDto(orderService.getById(orderId));
    }

    @GetMapping
    public List<OrderDto> getAll() {
        return orderService.getAll().stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }

    @GetMapping("/appUsers/{appUserId}")
    public List<OrderDto> getAllByAppUser(@PathVariable Long appUserId) {
        return orderService.getAll(appUserId).stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }

    @PostMapping
    public Long createOrder(@RequestBody OrderCreateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.create(order);
    }

    @PutMapping
    public Long updateOrder(@RequestBody OrderUpdateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.update(order);
    }

    @DeleteMapping("/{orderId}")
    public void deleteOrder(@PathVariable Long orderId) {
        orderService.delete(orderId);
    }

    @PostMapping("/{orderId}/positions/{orderPositionId}")
    public Long createPositionLink(@PathVariable Long orderId, @PathVariable Long orderPositionId) {
        return orderPositionService.createLinkToOrder(new OrderPositionLink(orderId, orderPositionId));
    }
}
