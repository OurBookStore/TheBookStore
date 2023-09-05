package ru.mephi.ourbookstore.service.appUser;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelMapper;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

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

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true, noRollbackFor = Exception.class)
    public AppUser getById(long appUserId) {
        AppUserModel appUserModel = appUserRepository.findById(appUserId)
                .orElseThrow(() -> new NotFoundException(APP_USER, "id", appUserId));
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
        AppUserModel appUserModel = appUserModelMapper.objectToModel(appUser);
        return appUserRepository.save(appUserModel).getId();
    }

    @Transactional
    public void update(AppUser appUser) {
        validate(appUser);
        Long appUserId = appUser.getId();
        appUserRepository.findById(appUserId)
                .orElseThrow(() -> new NotFoundException(APP_USER, "id", appUserId));
        String nickname = appUser.getNickname();
        if (appUserRepository.findByNickname(nickname).isPresent()) {
            throw new AlreadyExistException(APP_USER, "nickname", nickname);
        }
        String email = appUser.getEmail();
        if (appUserRepository.findByEmail(email).isPresent()) {
            throw new AlreadyExistException(APP_USER, "email", email);
        }
        AppUserModel appUserModel = appUserModelMapper.objectToModel(appUser);
        appUserRepository.save(appUserModel);
    }

    @Transactional
    public void delete(Long appUserId) {
        appUserRepository.findById(appUserId)
                .orElseThrow(() -> new NotFoundException(APP_USER, "id", appUserId));
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
