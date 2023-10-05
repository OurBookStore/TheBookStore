package ru.mephi.ourbookstore.domain.dto.keyCloak;

import lombok.Data;

import java.util.Set;


@Data
public class UserDto {
    private String id;
    private String username;
    private Boolean enabled;
    private Boolean emailVerified;
    private String firstName;
    private String lastName;
    private String email;
    private Set<RoleDto> roleSet;
}
