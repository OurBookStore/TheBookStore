package ru.mephi.ourbookstore.mapper.order;

import org.hibernate.annotations.Target;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;

@Mapper(componentModel = "spring")
public interface OrderDtoMapper {

    @Mapping(target="appUser.id", source="appUserId")
    Order dtoToObject(OrderCreateDto dto);

    OrderDto objectToDto(Order order);
}
