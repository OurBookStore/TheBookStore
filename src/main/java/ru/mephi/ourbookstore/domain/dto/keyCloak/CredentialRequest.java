package ru.mephi.ourbookstore.domain.dto.keyCloak;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CredentialRequest {

    private String type;
    private String value;
}
