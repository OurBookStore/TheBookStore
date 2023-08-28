package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.order.nullable.AppUserModelNullableMapper;
import ru.mephi.ourbookstore.mapper.order.nullable.OrderPositionModelNullableMapper;

@Mapper(componentModel = "spring", uses = {OrderPositionModelNullableMapper.class, AppUserModelNullableMapper.class})
public interface OrderModelMapper {

    Order modelToObject(OrderModel orderModel);

    OrderModel objectToModel(Order order);
}
