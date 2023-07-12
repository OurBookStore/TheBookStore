package ru.mephi.ourbookstore.domain;

import lombok.Getter;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Getter
public enum Entities {

    BOOK("book"),
    ORDER("order"),
    ORDER_POSITION("orderPosition"),
    AUTHOR("author"),
    CUSTOMER("customer");


    final String name;

    Entities(String name) {
        this.name = name;
    }
}
