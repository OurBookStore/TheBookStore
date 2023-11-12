package ru.mephi.ourbookstore.mapper.orderStatusHistory;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;

@Mapper(componentModel = "spring")
public interface OrderStatusHistoryModelNullableMapper {
    @Mappings({
            @Mapping(target = "order", expression = "java(null)")
    })
    OrderStatusHistory modelToObject(OrderStatusHistoryModel model);

    @Mappings({
            @Mapping(target = "order", expression = "java(null)")
    })
    OrderStatusHistoryModel objectToModel(OrderStatusHistory object);
}
