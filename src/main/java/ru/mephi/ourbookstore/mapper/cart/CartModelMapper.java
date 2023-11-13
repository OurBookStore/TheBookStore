package ru.mephi.ourbookstore.mapper.cart;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.CartModel;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionModelMapper;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring",
        uses = {
                OrderPositionModelMapper.class,
        }
)
public interface CartModelMapper {

    @Mappings({
            @Mapping(target = "appUser", expression = "java(null)"),
    })
    Cart modelToObject(CartModel model);

    @Mappings({
            @Mapping(target = "appUser", expression = "java(null)"),
    })
    CartModel objectToModel(Cart object);
}
