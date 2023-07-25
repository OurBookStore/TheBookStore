package ru.mephi.ourbookstore.mapper.appUser;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface AppUserModelMapper {

    AppUser modelToObject(AppUserModel model);

    AppUserModel objectToModel(AppUser book);
}
