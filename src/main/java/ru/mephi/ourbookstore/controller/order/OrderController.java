package ru.mephi.ourbookstore.controller.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.mapper.order.OrderDtoMapper;
import ru.mephi.ourbookstore.service.order.OrderService;

import java.util.List;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderController {

    final OrderService orderService;
    final OrderDtoMapper orderDtoMapper;


    @GetMapping("/{orderId}")
    public OrderDto getOrderById(@PathVariable Long orderId) {
        return orderDtoMapper.objectToDto(orderService.getById(orderId));
    }

    @GetMapping
    public List<OrderDto> getAllByAppUser(@RequestParam(required = false) Long appUserId) {
        if (appUserId != null) {
            return orderService.getAll(appUserId).stream()
                    .map(orderDtoMapper::objectToDto)
                    .toList();
        } else {
            return orderService.getAll().stream()
                    .map(orderDtoMapper::objectToDto)
                    .toList();
        }
    }


    @PostMapping
    public Long createOrder(@RequestBody OrderCreateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.create(order);
    }

    @DeleteMapping("/{orderId}")
    public void deleteOrder(@PathVariable Long orderId) {
        orderService.delete(orderId);
    }

}
