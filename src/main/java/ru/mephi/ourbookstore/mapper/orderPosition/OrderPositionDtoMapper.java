package ru.mephi.ourbookstore.mapper.orderPosition;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionDto;

@Mapper(componentModel = "spring")
public interface OrderPositionDtoMapper {

    @Mappings({
            @Mapping(target="book.id", source="bookId"),
            @Mapping(target ="order.id",source = "orderId")
    })
    OrderPosition dtoToObject(OrderPositionCreateDto dto);

    OrderPositionDto objectToDto(OrderPosition order);
}
