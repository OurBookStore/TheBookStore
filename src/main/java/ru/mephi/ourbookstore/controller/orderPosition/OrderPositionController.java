package ru.mephi.ourbookstore.controller.orderPosition;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionUpdateDto;
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
    public Long createOrderPosition(@RequestBody OrderPositionCreateDto orderPositionCreateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        return orderPositionService.create(orderPosition);
    }

    @PutMapping
    public Long updateOrderPosition(@RequestBody OrderPositionUpdateDto orderPositionCreateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        return orderPositionService.update(orderPosition);
    }

    @GetMapping("/{orderPositionId}")
    public OrderPositionDto getOrderPosition(@PathVariable Long orderPositionId) {
        return orderPositionDtoMapper.objectToDto(orderPositionService.getById(orderPositionId));
    }

    @DeleteMapping("/{orderPositionId}")
    public void deleteOrderPosition(@PathVariable Long orderPositionId) {
        orderPositionService.delete(orderPositionId);
    }
}
