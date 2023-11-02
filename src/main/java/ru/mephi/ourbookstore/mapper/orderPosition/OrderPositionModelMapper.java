package ru.mephi.ourbookstore.mapper.orderPosition;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.mapper.orderPosition.nullable.BookModelNullableMapper;
import ru.mephi.ourbookstore.mapper.orderPosition.nullable.CartModelNullableMapper;
import ru.mephi.ourbookstore.mapper.orderPosition.nullable.OrderModelNullableMapper;

@Mapper(componentModel = "spring", uses = {
        BookModelNullableMapper.class,
        OrderModelNullableMapper.class,
        CartModelNullableMapper.class,
})
public interface OrderPositionModelMapper {

    OrderPosition modelToObject(OrderPositionModel orderPositionModel);

    OrderPositionModel objectToModel(OrderPosition orderPosition);
}
