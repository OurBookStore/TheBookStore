package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author Bushueva Valery
 */

@Entity
@Table(name = "orders")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderModel {

    @Id
    @Column(name = "order_id")
    UUID id;

    @Column(name = "created_at")
    LocalDateTime createdDateTime;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    List<OrderPositionModel> booksInOrder = new ArrayList<>();

    @ManyToOne
    CustomerModel customer;
}
