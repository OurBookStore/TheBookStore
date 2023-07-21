package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.order.OrderPosition;

@Mapper(componentModel = "spring")
public interface OrderPositionModelMapper {
    OrderPosition modelToObject(OrderPositionModel model);
    OrderPositionModel objectToModel(OrderPosition orderPoition);
}
