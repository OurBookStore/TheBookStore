package ru.mephi.ourbookstore.mapper.orderPosition;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.dto.orderPosition.*;

@Mapper(componentModel = "spring")
public interface OrderPositionDtoMapper {

    @Mappings({
            @Mapping(target = "book.id", source = "bookId"),
    })
    OrderPosition dtoToObject(OrderPositionCreateDto dto);

    OrderPosition dtoToObject(OrderPositionUpdateDto dto);

    @Mappings({
            @Mapping(target = "orderId", source = "order.id"),
            @Mapping(target = "bookDto", source = "book")
    })
    OrderPositionDto objectToDto(OrderPosition order);


    @Mapping(target = "bookDto", source = "book")
    OrderPositionOfOrderDto OrderPositionToOrderPositionToOrderDto(OrderPosition order);
}
