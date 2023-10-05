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
import ru.mephi.ourbookstore.domain.dto.keyCloak.*;
import ru.mephi.ourbookstore.service.exceptions.BookStoreLocalError;
import ru.mephi.ourbookstore.service.exceptions.InvalidRequestException;
import ru.mephi.ourbookstore.service.exceptions.KeycloakIntegrationException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundUserException;

import java.net.URI;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;

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
     * Возвращает всех пользователей реалма.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>GET Request</b>: keycloakAuth/admin/realms/{realm_name}/users
     * - для получения всех пользователей.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak.<br>
     *
     * @return dto список пользователей
     * @author Gerasimychev Denis
     */
    public List<UserDto> getAllUsers() {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        return Objects.requireNonNull(webClient
                        .get()
                        .uri(uriBuilder -> uriBuilder
                                .path("/admin/realms/{realm_name}/users")
                                .build(realm))
                        .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                        .retrieve()
                        .onStatus(HttpStatusCode::isError, clientResponse ->
                                Mono.error(new KeycloakIntegrationException("realm is incorrect")))
                        .toEntityList(UserDto.class)
                        .block())
                .getBody();
    }

    /**
     * Возвращает пользователя по id.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>GET Request</b>: keycloakAuth/admin/realms/{realm_name}/users/{user_id}
     * - для получения пользователя по id
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если id будет не найден.<br>
     *
     * @return dto пользователя
     * @author Gerasimychev Denis
     */
    public UserDto getUserById(String id) {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        return webClient
                .get()
                .uri(uriBuilder -> uriBuilder
                        .path("/admin/realms/{realm_name}/users/{user_id}")
                        .build(realm, id))
                .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                .retrieve()
                .onStatus(HttpStatusCode::isError, clientResponse ->
                        Mono.error(new NotFoundUserException(id)))
                .bodyToMono(UserDto.class)
                .block();
    }

    /**
     * Возвращает действующие роли пользователя по id.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>GET Request</b>: keycloakAuth/admin/realms/{realm_name}/users/{user_id}
     * /role-mappings/clients/{client_container_id}/composite
     * - для получения пользователя по id
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Если id будет не найден;<br>
     * 4) Неверного импорта client_container_id.<br>
     *
     * @return Список действующих ролей пользователя
     * @author Gerasimychev Denis
     */
    public List<RoleDto> getUserRolesById(String id) {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        return Objects.requireNonNull(webClient
                        .get()
                        .uri(uriBuilder -> uriBuilder
                                .path("/admin/realms/{realm_name}/users/{user_id}")
                                .path("/role-mappings/clients/{client_container_id}/composite")
                                .build(realm, id, clientContainerId))
                        .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                        .retrieve()
                        .onStatus(HttpStatusCode::isError, clientResponse ->
                                Mono.error(new NotFoundUserException(id)))
                        .toEntityList(RoleDto.class)
                        .block())
                .getBody();
    }

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
                .uri(uriBuilder -> uriBuilder
                        .path("/realms/master/protocol/openid-connect/token")
                        .build())
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
                .uri(uriBuilder -> uriBuilder
                        .path("/realms/{realm_name}/protocol/openid-connect/token")
                        .build(realm))
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
                .uri(uriBuilder -> uriBuilder
                        .path("/realms/{realm_name}/protocol/openid-connect/token")
                        .build(realm))
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .body(BodyInserters.fromFormData(parameters))
                .retrieve()
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.NOT_FOUND),
                        clientResponse -> Mono.error(new KeycloakIntegrationException("realm is incorrect")))
                .onStatus(httpStatus -> httpStatus.equals(HttpStatus.BAD_REQUEST),
                        clientResponse -> Mono.error(new RuntimeException(String
                                .format(BookStoreLocalError
                                                .INVALID_REFRESH_TOKEN_EXCEPTION
                                                .getMessage(),
                                        refreshToken))))
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
     * @author Gerasimychev Denis
     */
    public String createUser(UserClientRequest userRequest) {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        AtomicReference<String> id = null;
        URI location = null;
        try {
            location = Objects.requireNonNull(webClient
                            .post()
                            .uri(uriBuilder -> uriBuilder
                                    .path("/admin/realms/{realm_name}/users")
                                    .build(realm))
                            .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                            .contentType(MediaType.APPLICATION_JSON)
                            .body(BodyInserters.fromValue(objectWriter.writeValueAsString(userRequest)))
                            .retrieve()
                            .onStatus(httpStatus -> httpStatus.equals(HttpStatus.CONFLICT),
                                    clientResponse -> Mono.error(new InvalidRequestException(userRequest)))
                            .onStatus(HttpStatusCode::isError, clientResponse ->
                                    Mono.error(new KeycloakIntegrationException()))
                            .toBodilessEntity()
                            .block())
                    .getHeaders().getLocation();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }


        return location.getFragment();
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
                .uri(uriBuilder -> uriBuilder
                        .path("/admin/realms/{realm_name}/users/{user_id}")
                        .build(realm, userId))
                .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                .retrieve()
                .onStatus(HttpStatusCode::isError, clientResponse ->
                        Mono.error(new KeycloakIntegrationException()))
                .toBodilessEntity()
                .block();
    }

    /**
     * Назначает список ролей пользователю по id.
     * <p>
     * Выполняет <b>POST Request</b>: keycloakAuth/realms/master/protocol/openid-connect/token
     * - для получения admin access token.
     * <br>
     * Выполняет <b>POST Request</b>: keycloakAuth/admin/realms/{realm_name}/users/{user_id}
     * /role-mappings/clients/{client_container_id}
     * - для назначения ролей.
     * <p>
     * Запрос не отработает в случаях:<br>
     * 1) Неверного импорта realm_name;<br>
     * 2) Если не удалось подключится к Keycloak;<br>
     * 3) Неверного импорта client_container_id;<br>
     * 4) Если userId будет не найден.<br>
     *
     * @param roleRequests список ролей для назначения
     * @param userId       id пользователя в keycloak
     * @author Gerasimychev Denis
     */
    public void assignRolesUser(List<RoleRequest> roleRequests, String userId) throws JsonProcessingException {
        AccessTokenResponse accessTokenResponse =
                adminAuthenticate(new AuthRequest(adminLogin, adminPassword));

        webClient
                .post()
                .uri(uriBuilder -> uriBuilder
                        .path("/admin/realms/{realm_name}/users")
                        .path("/{user_id}/role-mappings/clients/{client_container_id}")
                        .build(realm, userId, clientContainerId))
                .headers(h -> h.setBearerAuth(accessTokenResponse.getToken()))
                .body(BodyInserters.fromValue(objectWriter.writeValueAsString(roleRequests)))
                .retrieve()
                .onStatus(HttpStatusCode::isError, clientResponse ->
                        Mono.error(new NotFoundUserException(userId)))
                .toBodilessEntity()
                .block();
    }
}
