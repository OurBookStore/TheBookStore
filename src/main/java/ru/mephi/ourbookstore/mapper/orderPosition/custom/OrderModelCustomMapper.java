package ru.mephi.ourbookstore.mapper.orderPosition.custom;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;

@Mapper(componentModel = "spring")
public interface OrderModelCustomMapper {
    @Mappings(
            {
                    @Mapping(target = "orderPositions", expression = "java(null)"),
                    @Mapping(target = "appUser", expression = "java(null)")
            }
    )
    Order modelToObject(OrderModel orderModel);

    @Mappings(
            {
                    @Mapping(target = "orderPositions", expression = "java(null)"),
                    @Mapping(target = "appUser", expression = "java(null)")
            }
    )
    OrderModel objectToModel(Order order);
}
