package ru.mephi.ourbookstore.mapper.orderPosition;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.mapper.book.BookModelNullableMapper;

@Mapper(componentModel = "spring")
public interface OrderPositionModelNullableMapper {

    @Mappings({
            @Mapping(target = "book", expression = "java(null)"),
            @Mapping(target = "order", expression = "java(null)"),
            @Mapping(target = "cart", expression = "java(null)")
    })
    OrderPosition modelToObject(OrderPositionModel orderPositionModel);

    @Mappings({
            @Mapping(target = "book", expression = "java(null)"),
            @Mapping(target = "order", expression = "java(null)"),
            @Mapping(target = "cart", expression = "java(null)")
    })
    OrderPositionModel objectToModel(OrderPosition orderPosition);
}
