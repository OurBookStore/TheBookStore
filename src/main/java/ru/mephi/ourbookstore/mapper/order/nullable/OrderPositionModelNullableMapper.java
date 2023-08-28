package ru.mephi.ourbookstore.mapper.order.nullable;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;

@Mapper(componentModel = "spring")
public interface OrderPositionModelNullableMapper {

    @Mappings (
            {
                    @Mapping(target = "book.orderPositions", expression = "java(null)"),
                    @Mapping(target = "order", expression = "java(null)")
            }
    )
    OrderPosition modelToObject(OrderPositionModel orderPositionModel);

    @Mappings (
            {
                    @Mapping(target = "book", expression = "java(null)"),
                    @Mapping(target = "order", expression = "java(null)")
            }
    )
    OrderPositionModel objectToModel(OrderPosition orderPosition);
}
