package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;

@Mapper(componentModel = "spring")
public interface OrderModelMapper {

    Order modelToObject(OrderModel orderModel);

    OrderModel objectToModel(Order order);
}
