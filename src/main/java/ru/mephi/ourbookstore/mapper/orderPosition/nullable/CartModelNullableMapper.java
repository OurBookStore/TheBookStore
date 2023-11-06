package ru.mephi.ourbookstore.mapper.orderPosition.nullable;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.CartModel;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring", imports = {
        List.class,
})
public interface CartModelNullableMapper {

    @Mappings({
            @Mapping(target = "appUser", expression = "java(null)"),
            @Mapping(target = "orderPositions", expression = "java(List.of())"),
    })
    Cart modelToObject(CartModel model);

    @Mappings({
            @Mapping(target = "appUser", expression = "java(null)"),
            @Mapping(target = "orderPositions", expression = "java(List.of())"),
    })
    CartModel objectToModel(Cart object);
}
