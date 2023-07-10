package ru.mephi.ourbookstore.controller.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.book.Dog;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.mapper.order.OrderDtoMapper;

import java.util.List;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderController {

    final OrderService orderService;
    final OrderDtoMapper orderDtoMapper;

    @GetMapping("/{orderId}")
    public OrderDto getOrderById(@PathVariable long orderId) {
        return orderDtoMapper.objectToDto(orderService.getById(orderId));
    }

    @GetMapping
    public List<OrderDto> getAll() {
        return orderService.getAll().stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }

    @PostMapping
    public Long createNewOrder(@RequestBody OrderDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.createOrder(order);
    }

    @PutMapping
    public void updateExistingOrder(@RequestBody OrderDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        orderService.updateExisting(order);
    }

    @DeleteMapping("/{orderId}")
    public void deleteOrder(@PathVariable long orderId) {
        orderService.deleteOrder(orderId);
    }
}
