package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderUpdateDto;

@Mapper(componentModel = "spring")
public interface OrderDtoMapper {

    OrderDto objectToDto(Order order);

    Order dtoToObject (OrderCreateDto orderCreateDto);

    Order dtoToObject(OrderUpdateDto orderUpdateDto);

}
