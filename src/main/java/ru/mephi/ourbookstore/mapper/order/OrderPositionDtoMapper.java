package ru.mephi.ourbookstore.mapper.order;

import ru.mephi.ourbookstore.domain.dto.order.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.order.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderPositionDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderPositionUpdateDto;

public interface OrderPositionDtoMapper {
    OrderPosition dtoToObject(OrderPositionCreateDto orderPositionDto);
    OrderPosition dtoToObject(OrderPositionUpdateDto orderPositionDto);
    OrderPositionDto objectToDto(OrderPosition orderPosition);
}
