package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelNullableMapper;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionModelNullableMapper;
import ru.mephi.ourbookstore.mapper.orderStatusHistory.OrderStatusHistoryModelNullableMapper;

@Mapper(componentModel = "spring",
        uses = {
                OrderPositionModelNullableMapper.class,
                AppUserModelNullableMapper.class,
                OrderStatusHistoryModelNullableMapper.class,
        }
)
public interface OrderModelMapper {

    Order modelToObject(OrderModel orderModel);

    OrderModel objectToModel(Order order);
}
