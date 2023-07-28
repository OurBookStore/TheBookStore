package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.UUID;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionModel {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    UUID uuid;
    @ManyToOne
    BookModel book;
    @ManyToOne
    OrderModel order;
    int count;
    double price;
    double taxShare;
}
