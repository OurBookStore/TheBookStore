package ru.mephi.ourbookstore.domain.dto.keyCloak;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.HashMap;
import java.util.Map;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AccessTokenResponse {

    @JsonProperty("access_token")
    String token;
    @JsonProperty("expires_in")
    long expiresIn;
    @JsonProperty("refresh_expires_in")
    long refreshExpiresIn;
    @JsonProperty("refresh_token")
    String refreshToken;
    @JsonProperty("token_type")
    String tokenType;
    @JsonProperty("id_token")
    String idToken;
    @JsonProperty("not-before-policy")
    int notBeforePolicy;
    @JsonProperty("session_state")
    String sessionState;
    Map<String, Object> otherClaims = new HashMap<>();
    @JsonProperty("scope")
    String scope;
    @JsonProperty("error")
    String error;
    @JsonProperty("error_description")
    String errorDescription;
    @JsonProperty("error_uri")
    String errorUri;
}