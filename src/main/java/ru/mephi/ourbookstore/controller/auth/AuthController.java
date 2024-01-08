package ru.mephi.ourbookstore.controller.auth;

import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.keyCloak.AccessTokenResponse;
import ru.mephi.ourbookstore.domain.dto.keyCloak.AuthRequest;
import ru.mephi.ourbookstore.service.keyCloak.KeyCloakClient;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/account/oauth")
public class AuthController {

    private final KeyCloakClient keyCloakClient;

    @PostMapping("/token")
    @Operation(summary = "Get access token (grant type password)")
    public ResponseEntity<AccessTokenResponse> authenticate(
            @RequestBody(required = false) AuthRequest request,
            @RequestParam(value = "refresh_token", required = false) String refreshToken) {
        AccessTokenResponse accessTokenResponse;
        if (refreshToken != null) {
            log.info("Get request access token (grant type refresh token) : {}", refreshToken);
            accessTokenResponse = keyCloakClient.refreshToken(refreshToken);
        } else {
            if (request == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            log.info("Get request access token (grant type pass) : {}", request);
            accessTokenResponse = keyCloakClient.authenticate(request);
        }
        return ResponseEntity.ok(accessTokenResponse);
    }
}