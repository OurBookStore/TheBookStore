package ru.mephi.ourbookstore.domain;


import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.UUID;

@Entity
@Table(name = "order_positions")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionModel {

    @Id
    @Column(name = "position_id")
    UUID id;

    Long bookId;

    int count;

    @ManyToOne(fetch = FetchType.LAZY)
    OrderModel order;

}
