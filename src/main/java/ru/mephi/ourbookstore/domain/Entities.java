package ru.mephi.ourbookstore.domain;

import lombok.Getter;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Getter
public enum Entities {

    BOOK("book"),
    AUTHOR("author"),
    APP_USER("appUser");

    final String name;

    Entities(String name) {
        this.name = name;
    }
}
