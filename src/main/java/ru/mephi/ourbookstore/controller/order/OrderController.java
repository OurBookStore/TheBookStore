package ru.mephi.ourbookstore.controller.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.order.*;
import ru.mephi.ourbookstore.mapper.order.OrderDtoMapper;
import ru.mephi.ourbookstore.mapper.order.OrderPositionDtoMapper;
import ru.mephi.ourbookstore.service.order.OrderPositionService;
import ru.mephi.ourbookstore.service.order.OrderService;

import java.util.List;
import java.util.UUID;


@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderController {

    final OrderService orderService;

    final OrderPositionService orderPositionService;
    final OrderDtoMapper orderDtoMapper;

    final OrderPositionDtoMapper orderPositionDtoMapper;


    @GetMapping("/{orderId}")
    public OrderDto getOrderById(@PathVariable UUID orderId) {
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
        return orderService.getAllByCustomer(customerId).stream()
                .map(orderDtoMapper::objectToDto)
                .toList();
    }


    @PostMapping
    public UUID createOrder(@RequestBody OrderCreateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        return orderService.createOrder(order);
    }

    @PutMapping
    public void updateOrder(@RequestBody OrderUpdateDto orderDto) {
        Order order = orderDtoMapper.dtoToObject(orderDto);
        orderService.updateOrder(order);
    }

    @PostMapping
    public UUID createOrderPositionInExistingOrder(
            @RequestBody OrderPositionCreateDto orderPositionCreateDto,
            @RequestParam UUID orderId
    ) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        orderPosition.setOrderId(orderId);
        return orderPositionService.addNewOrderPosition(orderPosition);
    }

    @PutMapping
    public void updateExistingOrderPosition(@RequestBody OrderPositionUpdateDto orderPositionUpdateDto){
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionUpdateDto);
        orderPositionService.updateOrderPosition(orderPosition);
    }

    @DeleteMapping("/{orderId}")
    public void deleteOrder(@PathVariable UUID orderId) {
        orderService.deleteOrder(orderId);
    }
}
