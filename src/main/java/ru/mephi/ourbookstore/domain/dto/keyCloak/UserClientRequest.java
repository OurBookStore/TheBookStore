package ru.mephi.ourbookstore.domain.dto.keyCloak;

import lombok.Data;

import java.util.List;

@Data
public class UserClientRequest {
    private String username;
    private Boolean enabled;
    private String firstName;
    private String lastName;
    private String email;
    private List<CredentialRequest> credentials;
}
