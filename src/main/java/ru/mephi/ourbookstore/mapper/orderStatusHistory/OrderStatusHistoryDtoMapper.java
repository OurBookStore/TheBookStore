package ru.mephi.ourbookstore.mapper.orderStatusHistory;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistoryDto;

@Mapper(componentModel = "spring")
public interface OrderStatusHistoryDtoMapper {
    @Mapping(target = "orderId", source = "order.id")
    OrderStatusHistoryDto objectToDto(OrderStatusHistory object);
}
