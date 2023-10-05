package ru.mephi.ourbookstore.domain.dto.keyCloak;

import lombok.Data;

@Data
public class RoleRequest {
    private String id;
    private String name;
    private Boolean composite;
    private Boolean clientRole;
    private String containerId;
}
