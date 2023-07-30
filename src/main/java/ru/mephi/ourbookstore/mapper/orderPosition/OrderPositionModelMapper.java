package ru.mephi.ourbookstore.mapper.orderPosition;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;

@Mapper(componentModel = "spring")
public interface OrderPositionModelMapper {

    OrderPosition modelToObject(OrderPositionModel orderPositionModel);

    OrderPositionModel objectToModel(OrderPosition orderPosition);
}
