package ru.mephi.ourbookstore.mapper.appUser;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.keyCloak.UserClientRequest;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring" ,imports = {java.util.Arrays.class,
        ru.mephi.ourbookstore.domain.dto.keyCloak.CredentialRequest.class})
public interface AppUserModelMapper {

    AppUser modelToObject(AppUserModel appUserModel);

    AppUserModel objectToModel(AppUser appUser);

    @Mappings({
            @Mapping(target = "enabled", expression = "java(true)"),
            @Mapping(target = "credentials", expression = "java(Arrays.asList(new CredentialRequest(\"password\", appUser.getPassword() )))")
    })
    UserClientRequest objectToClientModel(AppUser appUser);
}
