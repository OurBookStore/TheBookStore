package ru.mephi.ourbookstore.controller.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.order.Order;
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
    public OrderDto getOrderById(@PathVariable long orderId) {
        return orderDtoMapper.objectToDto(orderService.getById(orderId));
    }

    @GetMapping
    public List<OrderDto> getAll() {
        return orderService.getAll().stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }

    @GetMapping
    public List<OrderDto> getAllByCustomer(@RequestParam long customerId) {
        return orderService.getAllByCustomerId(customerId).stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }


    @PostMapping
    public void updateExistingOrder(@RequestBody OrderDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        orderService.createOrderOrUpdateExisting(order);
    }

    @DeleteMapping("/{orderId}")
    public void deleteOrder(@PathVariable long orderId) {
        orderService.deleteOrder(orderId);
    }
}
