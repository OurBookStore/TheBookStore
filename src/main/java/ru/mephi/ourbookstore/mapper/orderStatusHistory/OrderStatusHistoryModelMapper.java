package ru.mephi.ourbookstore.mapper.orderStatusHistory;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;

@Mapper(componentModel = "spring")
public interface OrderStatusHistoryModelMapper {

    OrderStatusHistory modelToObject(OrderStatusHistoryModel orderStatusHistoryModel);

    OrderStatusHistoryModel objectToModel(OrderStatusHistory orderStatusHistory);
}
