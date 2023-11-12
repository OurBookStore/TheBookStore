package ru.mephi.ourbookstore.mapper.orderStatusHistory;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;
import ru.mephi.ourbookstore.mapper.orderStatusHistory.nullable.OrderNullableMapper;

@Mapper(componentModel = "spring", uses = {OrderNullableMapper.class})
public interface OrderStatusHistoryModelMapper {

    OrderStatusHistory modelToObject(OrderStatusHistoryModel orderStatusHistoryModel);

    OrderStatusHistoryModel objectToModel(OrderStatusHistory orderStatusHistory);
}
