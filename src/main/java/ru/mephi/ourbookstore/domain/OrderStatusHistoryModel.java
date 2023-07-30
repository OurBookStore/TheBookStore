package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(indexes = {
        @Index(columnList = "order_id, status", unique = true)
})
public class OrderStatusHistoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @ManyToOne
    OrderModel order;
    @Enumerated(EnumType.STRING)
    OrderStatus status;
    LocalDateTime dateTime;
    boolean isActual;
}
