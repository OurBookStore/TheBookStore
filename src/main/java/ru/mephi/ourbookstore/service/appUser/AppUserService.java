package ru.mephi.ourbookstore.service.appUser;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelMapper;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.service.keyCloak.KeyCloakClient;

import java.util.List;
import java.util.Optional;

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

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true, noRollbackFor = Exception.class)
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
        appUser.setKeycloakId(keyCloakClient.createUser(appUserModelMapper.objectToClientModel(appUser)));

        Cart cart = Cart.builder().build();
        appUser.setCart(cart);

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
        Optional<AppUserModel> appUserCheck = appUserRepository.findByNickname(nickname);
        if (appUserCheck.isPresent() && !appUserCheck.get().getId().equals(appUserId)) {
            throw new AlreadyExistException(APP_USER, "nickname", nickname);
        }
        String email = appUser.getEmail();
        appUserCheck = appUserRepository.findByEmail(email);
        if (appUserCheck.isPresent() && !appUserCheck.get().getId().equals(appUserId)) {
            throw new AlreadyExistException(APP_USER, "email", email);
        }
        old.setEmail(appUser.getEmail());
        old.setNickname(appUser.getNickname());
        old.setPassword(appUser.getPassword());
        keyCloakClient.updateUser(appUserModelMapper.objectToClientModel(appUser), old.getKeycloakId());
        appUserRepository.save(old);
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
