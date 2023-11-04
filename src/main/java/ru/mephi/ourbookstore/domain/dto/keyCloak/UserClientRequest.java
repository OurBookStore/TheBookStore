package ru.mephi.ourbookstore.domain.dto.keyCloak;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserClientRequest {

    private String username;
    private Boolean enabled;
    private String firstName;
    private String lastName;
    private String email;
    private List<CredentialRequest> credentials;
}
