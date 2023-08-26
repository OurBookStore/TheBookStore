package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.order.custom.AppUserModelCustomMapper;
import ru.mephi.ourbookstore.mapper.order.custom.OrderPositionModelCustomMapper;

@Mapper(componentModel = "spring", uses = {OrderPositionModelCustomMapper.class, AppUserModelCustomMapper.class})
public interface OrderModelMapper {

    Order modelToObject(OrderModel orderModel);

    OrderModel objectToModel(Order order);
}
