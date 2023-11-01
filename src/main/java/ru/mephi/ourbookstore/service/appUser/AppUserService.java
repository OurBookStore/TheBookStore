package ru.mephi.ourbookstore.service.appUser;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelMapper;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.KeycloakIntegrationException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.service.keyCloak.KeyCloakClient;

import static ru.mephi.ourbookstore.domain.Entities.APP_USER;


/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUserService {

    final AppUserRepository appUserRepository;
    final AppUserModelMapper appUserModelMapper;
    final KeyCloakClient keyCloakClient;

    @Transactional(readOnly = true)
    public AppUser getById(long appUserId) {
        AppUserModel appUserModel = appUserRepository.findById(appUserId)
                .orElseThrow(() -> new NotFoundException(APP_USER, "id", appUserId));
        return appUserModelMapper.modelToObject(appUserModel);
    }

    @Transactional(readOnly = true)
    public AppUser getUserInfo(Jwt jwt) {
        AppUserModel appUserModel = appUserRepository.findAppUserModelByKeycloakId(jwt.getSubject())
                .orElseThrow(() -> new NotFoundException(APP_USER, "keycloak_id", jwt.getSubject()));
        return appUserModelMapper.modelToObject(appUserModel);
    }

    public List<AppUser> getAll() {
        return appUserRepository.findAll().stream()
                .map(appUserModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public Long create(AppUser appUser) {
        validate(appUser);
        String nickname = appUser.getNickname();
        if (appUserRepository.findByNickname(nickname).isPresent()) {
            throw new AlreadyExistException(APP_USER, "nickname", nickname);
        }
        String email = appUser.getEmail();
        if (appUserRepository.findByEmail(email).isPresent()) {
            throw new AlreadyExistException(APP_USER, "email", email);
        }
        appUser.setKeycloakId( keyCloakClient.createUser(appUserModelMapper.objectToClientModel(appUser)));
        AppUserModel appUserModel = appUserModelMapper.objectToModel(appUser);
        return appUserRepository.save(appUserModel).getId();
    }

    @Transactional
    public void update(AppUser appUser) {
        validate(appUser);
        Long appUserId = appUser.getId();
        AppUserModel old = appUserRepository.findById(appUserId)
                .orElseThrow(() -> new NotFoundException(APP_USER, "id", appUserId));
        String nickname = appUser.getNickname();
        if (appUserRepository.findByNickname(nickname).isPresent()) {
            throw new AlreadyExistException(APP_USER, "nickname", nickname);
        }
        String email = appUser.getEmail();
        if (appUserRepository.findByEmail(email).isPresent()) {
            throw new AlreadyExistException(APP_USER, "email", email);
        }
        keyCloakClient.updateUser(appUserModelMapper.objectToClientModel(appUser),old.getKeycloakId());
        AppUserModel appUserModel = appUserModelMapper.objectToModel(appUser);
        appUserRepository.save(appUserModel);
    }

    @Transactional
    public void delete(Long appUserId) {
        AppUserModel old = appUserRepository.findById(appUserId)
                .orElseThrow(() -> new NotFoundException(APP_USER, "id", appUserId));
        keyCloakClient.deleteUser(old.getKeycloakId());
        appUserRepository.deleteById(appUserId);
    }

    private void validate(AppUser appUser) {
        String email = appUser.getEmail();
        if (email == null || email.isBlank()) {
            throw new ValidationException(APP_USER, "email", email);
        }
        String nickname = appUser.getNickname();
        if (nickname == null || nickname.isBlank()) {
            throw new ValidationException(APP_USER, "nickname", nickname);
        }
        String password = appUser.getPassword();
        if (password == null || password.isBlank()) {
            throw new ValidationException(APP_USER, "password", password);
        }
    }
}
