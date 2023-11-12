package ru.mephi.ourbookstore.mapper.orderStatusHistory.nullable;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;

@Mapper(componentModel = "spring")
public interface OrderNullableMapper {
    @Mappings(
            {
                    @Mapping(target = "orderStatusHistories", expression = "java(List.of())"),
                    @Mapping(target = "actualOSH", expression = "java(null)")
            }
    )
    Order modelToObject(OrderModel model);

    @Mappings (
            {
                    @Mapping(target = "orderStatusHistories", expression = "java(List.of())"),
                    @Mapping(target = "actualOSH", expression = "java(null)")
            }
    )
    OrderModel objectToModel(Order object);
}
