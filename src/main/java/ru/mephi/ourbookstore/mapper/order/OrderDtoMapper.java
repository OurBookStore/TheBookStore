package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;

@Mapper(componentModel = "spring")
public interface OrderDtoMapper {

    Order dtoToObject(OrderDto order);
    OrderDto objectToDto(Order order);

}
