package ru.mephi.ourbookstore.mapper.appUser;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserCreateDto;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserDto;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserUpdateDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface AppUserDtoMapper {

    AppUser dtoToObject(AppUserCreateDto model);

    AppUser dtoToObject(AppUserUpdateDto model);

    @Mapping(target = "cartId", source = "cart.id")
    AppUserDto objectToDto(AppUser appUser);

}
