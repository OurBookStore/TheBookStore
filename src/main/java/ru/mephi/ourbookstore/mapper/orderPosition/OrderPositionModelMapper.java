package ru.mephi.ourbookstore.mapper.orderPosition;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.mapper.orderPosition.custom.BookModelCustomMapper;
import ru.mephi.ourbookstore.mapper.orderPosition.custom.OrderModelCustomMapper;

@Mapper(componentModel = "spring", uses = {BookModelCustomMapper.class, OrderModelCustomMapper.class})
public interface OrderPositionModelMapper {

    OrderPosition modelToObject(OrderPositionModel orderPositionModel);

    OrderPositionModel objectToModel(OrderPosition orderPosition);
}
