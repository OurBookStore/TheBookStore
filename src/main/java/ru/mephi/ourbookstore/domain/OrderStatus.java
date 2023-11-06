package ru.mephi.ourbookstore.domain;

public enum OrderStatus {
    CREATED("created"),
    PROCESSING("processing"),
    DELIVERING("delivering"),
    DONE("done"),
    CANCELED("canceled");

    final String name;

    OrderStatus(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
