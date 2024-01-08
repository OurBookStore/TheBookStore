package ru.mephi.ourbookstore.mapper.order;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelNullableMapper;

@Mapper(componentModel = "spring",
        uses = {
                AppUserModelNullableMapper.class,
        })
public interface OrderModelNullableMapper {
    @Mappings({
            @Mapping(target = "orderPositions", expression = "java(null)"),
            @Mapping(target = "orderStatusHistories", expression = "java(null)")
    })
    Order modelToObject(OrderModel orderModel);

    @Mappings({
            @Mapping(target = "orderPositions", expression = "java(null)"),
            @Mapping(target = "orderStatusHistories", expression = "java(null)")
    })
    OrderModel objectToModel(Order order);
}
