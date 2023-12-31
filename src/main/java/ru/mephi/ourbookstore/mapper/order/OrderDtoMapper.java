package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderUpdateDto;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionDtoMapper;

@Mapper(componentModel = "spring", uses = OrderPositionDtoMapper.class)
public interface OrderDtoMapper {

    @Mapping(target = "appUser.id", source = "appUserId")
    Order dtoToObject(OrderCreateDto dto);

    Order dtoToObject(OrderUpdateDto dto);

    @Mappings({
            @Mapping(target = "appUserDto", source = "appUser"),
    })
    OrderDto objectToDto(Order order);
}
