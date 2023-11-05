package ru.mephi.ourbookstore.service.keyCloak;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import ru.mephi.ourbookstore.domain.dto.keyCloak.AccessTokenResponse;
import ru.mephi.ourbookstore.domain.dto.keyCloak.AuthRequest;
import ru.mephi.ourbookstore.domain.dto.keyCloak.UserClientRequest;
import ru.mephi.ourbookstore.service.exceptions.keyclaok.BookStoreKeycloakError;
import ru.mephi.ourbookstore.service.exceptions.keyclaok.InvalidRequestException;
import ru.mephi.ourbookstore.service.exceptions.keyclaok.KeycloakIntegrationException;

import java.util.Objects;

@Slf4j
@Component
@RequiredArgsConstructor
public class KeyCloakClient {

    private final WebClient webClient;
    private final ObjectWriter objectWriter;
    @Value("${keycloak.client-name}")
    private String clientId;
    @Value("${keycloak.realm}")
    private String realm;
    @Value("${keycloak-admin.client-container-id}")
    private String clientContainerId;
    @Value("${keycloak-admin.login}")
    private String adminLogin;
    @Value("${keycloak-admin.password}")
    private String adminPassword;

    /**
     * Получает admin access token.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Если не удалось подключится к Keycloak;<br>
     * 2) Если логин и пароль невалидны.<br>
     *
     * @param request логин и пароль для аутентификации.
     * @return admin access token
     * @author Gerasimychev Denis
     */
    public AccessTokenResponse adminAuthenticate(AuthRequest request) {
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("username", request.getUsername());
        parameters.add("password", request.getPassword());
        parameters.add("grant_type", "password");
        parameters.add("client_id", "admin-cli");

        return webClient
                .post()
                .uri("/realms/master/protocol/openid-connect/token")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .body(BodyInserters.fromFormData(parameters))
                .retrieve()
                .onStatus(HttpStatusCode::isError, clientResponse ->
                        Mono.error(new InvalidRequestException(request)))
                .bodyToMono(AccessTokenResponse.class)
                .block();
    }

    /**
     * Получает access token пользователя реалма.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/{realm_name}/protocol/openid-connect/token
     * - для получения access token.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Неверного импорта client_id; <br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если логин и пароль невалидны.<br>
     *
     * @param request логин и пароль для аутентификации.
     * @return access token
     * @author Gerasimychev Denis
     */
    public AccessTokenResponse authenticate(AuthRequest request) {
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("username", request.getUsername());
        parameters.add("password", request.getPassword());
        parameters.add("grant_type", "password");
        parameters.add("client_id", clientId);

        return webClient
                .post()
                .uri("/realms/{realm_name}/protocol/openid-connect/token",realm)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .body(BodyInserters.fromFormData(parameters))
                .retrieve()
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.NOT_FOUND),
                        clientResponse -> Mono.error(new KeycloakIntegrationException("realm is incorrect")))
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.BAD_REQUEST),
                        clientResponse -> Mono.error(new KeycloakIntegrationException("client id is incorrect")))
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.UNAUTHORIZED),
                        clientResponse -> Mono.error(new InvalidRequestException(request)))
                .bodyToMono(AccessTokenResponse.class)
                .block();
    }

    /**
     * Получает access token пользователя реалма по refresh token.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/{realm_name}/protocol/openid-connect/token
     * - для получения access token.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если рефреш токен не валиден.<br>
     *
     * @param refreshToken рефреш токен для аутентификации
     * @return access token
     * @author Gerasimychev Denis
     */
    public AccessTokenResponse refreshToken(String refreshToken) {
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("grant_type", "refresh_token");
        parameters.add("client_id", clientId);
        parameters.add("refresh_token", refreshToken);

        return webClient
                .post()
                .uri("/realms/{realm_name}/protocol/openid-connect/token",realm)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .body(BodyInserters.fromFormData(parameters))
                .retrieve()
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.NOT_FOUND),
                        clientResponse -> Mono.error(new KeycloakIntegrationException("realm is incorrect")))
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.BAD_REQUEST),
                        clientResponse -> Mono.error(new InvalidRequestException(refreshToken)))
                .bodyToMono(AccessTokenResponse.class)
                .block();
    }

    /**
     * Создает пользователя в Keycloak.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>POST Request</b>: keycloakAuth/admin/realms/{realm_name}/users
     * - для создания пользователя.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если такой пользователей уже существует;<br>
     * 4) Если запрос не валиден.<br>
     * <p>
     * Пример тела запроса:
     * <code>
     * {
     * "firstName":"Sergey",
     * "lastName":"Kargopolov",
     * "email":"test@test.com",
     * "enabled":"true",
     * "username":"app-user",
     * "credentials": [
     * {
     * "type": "password",
     * "value": "1"
     * }
     * ]
     * }
     * </code>
     *
     * @param userRequest класс для тела запроса по созданию пользователя
     * @return ID пользователя
     * @author Gerasimychev Denis
     */
    public String createUser(UserClientRequest userRequest) {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        String path;
        try {
            path = Objects.requireNonNull(Objects.requireNonNull(webClient
                            .post()
                            .uri("/admin/realms/{realm_name}/users",realm)
                            .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                            .contentType(MediaType.APPLICATION_JSON)
                            .body(BodyInserters.fromValue(objectWriter.writeValueAsString(userRequest)))
                            .retrieve()
                            .onStatus(httpStatus -> httpStatus.equals(HttpStatus.CONFLICT),
                                    clientResponse -> Mono.error(new InvalidRequestException(userRequest,
                                            BookStoreKeycloakError.KEYCLOAK_USER_CONFLICT_EXCEPTION)))
                            .onStatus(httpStatus -> httpStatus.equals(HttpStatus.BAD_REQUEST),
                                    clientResponse -> Mono.error(new InvalidRequestException(userRequest,
                                            BookStoreKeycloakError.KEYCLOAK_USER_VALID_EXCEPTION)))
                            .onStatus(HttpStatusCode::isError, clientResponse ->
                                    Mono.error(new KeycloakIntegrationException()))
                            .toBodilessEntity()
                            .block())
                    .getHeaders().getLocation()).getPath();
        } catch (JsonProcessingException | NullPointerException e) {
            throw new KeycloakIntegrationException("Incorrect data were obtained", e);
        }

        return path.substring(path.indexOf("users/") + 6);
    }

    /**
     * Обновляет пользователя в Keycloak.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>PUT Request</b>: keycloakAuth/admin/realms/{realm_name}/users
     * - для создания пользователя.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если такой пользователей уже существует.<br>
     * <p>
     * Пример тела запроса:
     * <code>
     * {
     * "firstName":"Sergey",
     * "lastName":"Kargopolov",
     * "email":"test@test.com",
     * "enabled":"true",
     * "username":"app-user",
     * "credentials": [
     * {
     * "type": "password",
     * "value": "1"
     * }
     * ]
     * }
     * </code>
     *
     * @param userRequest класс для тела запроса по созданию пользователя
     * @param userId      индентификаитор пользователя в keycloak
     * @author Gerasimychev Denis
     */
    public void updateUser(UserClientRequest userRequest, String userId) {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        try {
            webClient
                    .put()
                    .uri("/admin/realms/{realm_name}/users/{user_id}",realm,userId)
                    .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(BodyInserters.fromValue(objectWriter.writeValueAsString(userRequest)))
                    .retrieve()
                    .onStatus(httpStatus -> httpStatus.equals(HttpStatus.CONFLICT),
                            clientResponse -> Mono.error(new InvalidRequestException(userRequest,
                                    BookStoreKeycloakError.KEYCLOAK_USER_CONFLICT_EXCEPTION)))
                    .onStatus(httpStatus -> httpStatus.equals(HttpStatus.BAD_REQUEST),
                            clientResponse -> Mono.error(new InvalidRequestException(userRequest,
                                    BookStoreKeycloakError.KEYCLOAK_USER_VALID_EXCEPTION)))
                    .onStatus(HttpStatusCode::isError, clientResponse ->
                            Mono.error(new KeycloakIntegrationException()))
                    .toBodilessEntity()
                    .block();
        } catch (JsonProcessingException e) {
            throw new KeycloakIntegrationException("Incorrect data were obtained", e);
        }

    }

    /**
     * Удаляет пользователя в Keycloak.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>DELETE Request</b>: keycloakAuth/admin/realms/{realm_name}/users/{user_id}
     * - для удаления пользователя.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если userId будет не найден.<br>
     *
     * @param userId id пользователя
     * @author Gerasimychev Denis
     */
    public void deleteUser(String userId) {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        webClient
                .delete()
                .uri("/admin/realms/{realm_name}/users/{user_id}",realm,userId)
                .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                .retrieve()
                .onStatus(HttpStatusCode::isError, clientResponse ->
                        Mono.error(new KeycloakIntegrationException()))
                .toBodilessEntity()
                .block();
    }
}
