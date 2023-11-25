package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;

@Mapper(componentModel = "spring")
public interface OrderModelNullableMapper {
    @Mappings({
            @Mapping(target = "orderPositions", expression = "java(null)"),
            @Mapping(target = "appUser", expression = "java(null)"),
            @Mapping(target = "orderStatusHistories",  expression = "java(null)")
    })
    Order modelToObject(OrderModel orderModel);

    @Mappings({
            @Mapping(target = "orderPositions", expression = "java(null)"),
            @Mapping(target = "appUser", expression = "java(null)"),
            @Mapping(target = "orderStatusHistories",  expression = "java(null)")
    })
    OrderModel objectToModel(Order order);
}
