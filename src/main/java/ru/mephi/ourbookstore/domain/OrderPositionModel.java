package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;


@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @ManyToOne(cascade = {CascadeType.MERGE})
    BookModel book;
    @ManyToOne(cascade = {CascadeType.MERGE})
    OrderModel order;
    int count;
    double price;
    @ManyToOne(cascade = {CascadeType.MERGE})
    CartModel cart;
}
