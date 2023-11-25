package ru.mephi.ourbookstore.mapper.orderStatusHistory;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;
import ru.mephi.ourbookstore.mapper.order.OrderModelNullableMapper;

@Mapper(componentModel = "spring",
    uses = {
        OrderModelNullableMapper.class,
    }
)
public interface OrderStatusHistoryModelMapper {

    OrderStatusHistory modelToObject(OrderStatusHistoryModel orderStatusHistoryModel);

    OrderStatusHistoryModel objectToModel(OrderStatusHistory orderStatusHistory);
}
