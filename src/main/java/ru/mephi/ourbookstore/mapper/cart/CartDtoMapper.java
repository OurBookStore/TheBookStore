package ru.mephi.ourbookstore.mapper.cart;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.cart.CartDto;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionDtoMapper;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring", uses = {OrderPositionDtoMapper.class})
public interface CartDtoMapper {

    Cart dtoToObject(CartDto dto);

    CartDto objectToDto(Cart object);
}
