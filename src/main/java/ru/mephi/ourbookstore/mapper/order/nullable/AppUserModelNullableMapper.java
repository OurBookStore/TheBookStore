package ru.mephi.ourbookstore.mapper.order.nullable;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;

@Mapper(componentModel = "spring")
public interface AppUserModelNullableMapper {

    @Mapping(target = "orders", expression = "java(null)")
    AppUser modelToObject(AppUserModel appUserModel);

    @Mapping(target = "orders", expression = "java(null)")
    AppUserModel objectToModel(AppUser appUser);
}
