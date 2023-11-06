package ru.mephi.ourbookstore.util.authRules;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum Resource {
    APP_USER("app user"),
    ORDER_POSITION("order position"),
    CART("cart"),
    ORDER("order");

    final String name;

    Resource(String name) {
        this.name = name;
    }
}
