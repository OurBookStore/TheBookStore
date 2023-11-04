package ru.mephi.ourbookstore.appUser;

import java.util.List;
import java.util.Optional;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.controller.appUser.AppUserController;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserCreateDto;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserDto;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserUpdateDto;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelMapper;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.repository.cart.CartRepository;
import ru.mephi.ourbookstore.service.appUser.AppUserService;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.service.keyCloak.KeyCloakClient;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@FieldDefaults(level = AccessLevel.PRIVATE)
@ExtendWith(MockitoExtension.class)
public class AppUserTests extends BookStoreTest {


    @InjectMocks
    AppUserController appUserController;

    @Spy
//    @Autowired
    AppUserRepository appUserRepository;

//    @InjectMocks
//    @Autowired
//    AppUserService appUserService;

    @Mock
    KeyCloakClient keyCloakClient;

    @Autowired
    AppUserRepository appUserRepository;
    @Autowired
    CartRepository cartRepository;

    AppUserModelMapper appUserModelMapper;
    final AppUserModel APP_USER_CORRECT_1 = AppUserModel.builder()
            .id(1L)
            .nickname("1")
            .email("1")
            .password("1")
            .build();

    final AppUserModel APP_USER_CORRECT_2 = AppUserModel.builder()
            .id(2L)
            .nickname("2")
            .email("2")
            .password("2")
            .build();

    final AppUserCreateDto APP_USER_DTO_CRT = AppUserCreateDto.builder()
            .nickname("3")
            .email("3")
            .password("3")
            .build();
    final AppUserUpdateDto APP_USER_DTO_UPD = AppUserUpdateDto.builder()
            .id(3L)
            .nickname("3")
            .email("3")
            .password("3")
            .build();

    final AppUserCreateDto APP_USER_DTO_INCORRECT_EMAIl_1_CRT = AppUserCreateDto.builder()
            .nickname("4")
            .password("4")
            .build();

    final AppUserUpdateDto APP_USER_DTO_INCORRECT_EMAIl_1_UPD = AppUserUpdateDto.builder()
            .id(4L)
            .nickname("4")
            .password("4")
            .build();

    final AppUserCreateDto APP_USER_DTO_INCORRECT_EMAIl_2_CRT = AppUserCreateDto.builder()
            .nickname("4")
            .email("")
            .password("4")
            .build();
    final AppUserUpdateDto APP_USER_DTO_INCORRECT_EMAIl_2_UPD = AppUserUpdateDto.builder()
            .id(4L)
            .nickname("4")
            .email("")
            .password("4")
            .build();


    final AppUserCreateDto APP_USER_DTO_INCORRECT_PASSWORD_1_CRT = AppUserCreateDto.builder()
            .nickname("5")
            .email("5")
            .build();
    final AppUserCreateDto APP_USER_DTO_INCORRECT_PASSWORD_2_CRT = AppUserCreateDto.builder()
            .nickname("5")
            .email("5")
            .password("")
            .build();
    final AppUserUpdateDto APP_USER_DTO_INCORRECT_PASSWORD_1_UPD = AppUserUpdateDto.builder()
            .id(5L)
            .nickname("5")
            .email("5")
            .build();
    final AppUserUpdateDto APP_USER_DTO_INCORRECT_PASSWORD_2_UPD = AppUserUpdateDto.builder()
            .id(5L)
            .nickname("5")
            .email("5")
            .password("")
            .build();
    final AppUserCreateDto APP_USER_DTO_INCORRECT_NICKNAME_1_CRT = AppUserCreateDto.builder()
            .email("6")
            .password("6")
            .build();

    final AppUserUpdateDto APP_USER_DTO_INCORRECT_NICKNAME_1_UPD = AppUserUpdateDto.builder()
            .id(6L)
            .email("6")
            .password("6")
            .build();


    final AppUserCreateDto APP_USER_DTO_INCORRECT_NICKNAME_2_CRT = AppUserCreateDto.builder()
            .nickname("")
            .email("6")
            .password("6")
            .build();
    final AppUserUpdateDto APP_USER_DTO_INCORRECT_NICKNAME_2_UPD = AppUserUpdateDto.builder()
            .id(6L)
            .nickname("")
            .email("6")
            .password("6")
            .build();

    final List<AppUserModel> APP_USERS = List.of(
            APP_USER_CORRECT_1,
            APP_USER_CORRECT_2
    );

    @AfterEach
    public void dropDb() {
        appUserRepository.deleteAll();
    }

    @Test
    public void getByIdTest() {
        Long appUserId = appUserRepository.save(APP_USER_CORRECT_1).getId();

        AppUserDto appUserRsDto = appUserController.getById(appUserId);

        assertAppUsers(APP_USER_CORRECT_1, appUserRsDto);
    }

    @Test
    public void getByIdExceptionTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> appUserController.getById(-1)
        );
    }

    @Test
    public void getAllTest() {
        appUserRepository.saveAll(APP_USERS);

        List<AppUserDto> appUserRsDtos = appUserController.getAll();

        Assertions.assertEquals(appUserRsDtos.size(), APP_USERS.size());
        for (int i = 0; i < APP_USERS.size(); i++) {
            AppUserModel expected = APP_USERS.get(i);
            AppUserDto actual = appUserRsDtos.get(i);
            assertAppUsers(expected, actual);
        }
    }

    @Test
    public void createTest() {
        Long appUserId = appUserController.create(APP_USER_DTO_CRT);

        AppUserModel appUserModel = appUserRepository.findById(appUserId).get();

        assertAppUsers(APP_USER_DTO_CRT, appUserModel);
    }

    @Test
    public void createAlreadyExistNicknameTest() {
        appUserRepository.save(APP_USER_CORRECT_1);
        AppUserCreateDto appUserRqDto = AppUserCreateDto.builder()
                .nickname(APP_USER_CORRECT_1.getNickname())
                .email("some email")
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> appUserController.create(appUserRqDto)
        );
    }

    @Test
    public void createAlreadyExistEmailTest() {
        appUserRepository.save(APP_USER_CORRECT_1);
        AppUserCreateDto appUserRqDto = AppUserCreateDto.builder()
                .nickname("some nickname")
                .email(APP_USER_CORRECT_1.getEmail())
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> appUserController.create(appUserRqDto)
        );
    }

    @Test
    public void createIncorrectNickname1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.create(APP_USER_DTO_INCORRECT_NICKNAME_1_CRT)
        );
    }

    @Test
    public void createIncorrectNickname2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.create(APP_USER_DTO_INCORRECT_NICKNAME_2_CRT)
        );
    }

    @Test
    public void createIncorrectPassword1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.create(APP_USER_DTO_INCORRECT_PASSWORD_1_CRT)
        );
    }

    @Test
    public void createIncorrectPassword2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.create(APP_USER_DTO_INCORRECT_PASSWORD_2_CRT)
        );
    }

    @Test
    public void createIncorrectEmail1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.create(APP_USER_DTO_INCORRECT_EMAIl_1_CRT)
        );
    }

    @Test
    public void createIncorrectEmail2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.create(APP_USER_DTO_INCORRECT_EMAIl_2_CRT)
        );
    }

    @Test
    public void updateTest() {
        Long appUserId = appUserRepository.save(APP_USER_CORRECT_1).getId();
        AppUserUpdateDto appUserRqDto = AppUserUpdateDto.builder()
                .id(appUserId)
                .nickname("new nickname")
                .email("new email")
                .password("new password")
                .build();
//        AppUser appUser = AppUser.builder()
//                .id(appUserId)
//                .nickname("new nickname")
//                .email("new email")
//                .password("new password")
//                .build();
//
//
//        Mockito
//                .when(keyCloakClient.updateUser(appUserModelMapper.objectToClientModel(appUser),null))
//                .thenAnswer(invocation -> "Always the same")
        appUserController.update(appUserRqDto);

        AppUserModel appUserModel = appUserRepository.findById(appUserId).get();
        assertAppUsers(appUserRqDto, appUserModel);
    }

    @Test
    public void updateNotFoundTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> appUserController.update(APP_USER_DTO_UPD)
        );
    }

    @Test
    public void updateIncorrectName1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.update(APP_USER_DTO_INCORRECT_NICKNAME_1_UPD)
        );
    }

    @Test
    public void updateIncorrectName2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.update(APP_USER_DTO_INCORRECT_NICKNAME_2_UPD)
        );
    }

    @Test
    public void updateIncorrectPassword1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.update(APP_USER_DTO_INCORRECT_PASSWORD_1_UPD)
        );
    }

    @Test
    public void updateIncorrectPassword2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.update(APP_USER_DTO_INCORRECT_PASSWORD_2_UPD)
        );
    }

    @Test
    public void updateIncorrectEmail1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.update(APP_USER_DTO_INCORRECT_EMAIl_1_UPD)
        );
    }

    @Test
    public void updateIncorrectEmail2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> appUserController.update(APP_USER_DTO_INCORRECT_EMAIl_2_UPD)
        );
    }

    @Test
    public void updateAlreadyExistNicknameTest() {
        Long appUserId = appUserRepository.save(APP_USER_CORRECT_1).getId();
        AppUserUpdateDto appUserRqDto = AppUserUpdateDto.builder()
                .id(appUserId)
                .nickname(APP_USER_CORRECT_1.getNickname())
                .email("some email")
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> appUserController.update(appUserRqDto)
        );
    }

    @Test
    public void updateAlreadyExistEmailTest() {
        Long appUserId = appUserRepository.save(APP_USER_CORRECT_1).getId();
        AppUserUpdateDto appUserRqDto = AppUserUpdateDto.builder()
                .id(appUserId)
                .nickname("some nickname")
                .email(APP_USER_CORRECT_1.getEmail())
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> appUserController.update(appUserRqDto)
        );
    }

    @Test
    public void deleteTest() {
        Long appUserId = appUserRepository.save(APP_USER_CORRECT_1).getId();

        appUserController.delete(appUserId);

        Optional<AppUserModel> appUserModel = appUserRepository.findById(appUserId);
        Assertions.assertTrue(appUserModel.isEmpty());
    }

    @Test
    public void deleteNotFoundTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> appUserController.delete(-1)
        );
    }

    private void assertAppUsers(AppUserModel expected, AppUserDto actual) {
        Assertions.assertEquals(expected.getNickname(), actual.getNickname());
        Assertions.assertEquals(expected.getEmail(), actual.getEmail());
    }

    private void assertAppUsers(AppUserCreateDto expected, AppUserModel actual) {
        Assertions.assertEquals(expected.getNickname(), actual.getNickname());
        Assertions.assertEquals(expected.getEmail(), actual.getEmail());
    }

    private void assertAppUsers(AppUserUpdateDto expected, AppUserModel actual) {
        Assertions.assertEquals(expected.getNickname(), actual.getNickname());
        Assertions.assertEquals(expected.getEmail(), actual.getEmail());
    }
}
