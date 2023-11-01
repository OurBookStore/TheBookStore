package ru.mephi.ourbookstore.mapper.appUser;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.mapper.cart.CartModelMapper;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring", uses = {
        CartModelMapper.class,
})
public interface AppUserModelMapper {

    AppUser modelToObject(AppUserModel appUserModel);

    AppUserModel objectToModel(AppUser appUser);
}
