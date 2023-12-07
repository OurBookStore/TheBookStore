package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.Type;

import java.sql.Time;
import java.time.LocalDateTime;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(indexes = {
        @Index(columnList = "order_id, status", unique = false)
})
public class OrderStatusHistoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "order_id", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    @ToString.Exclude
    OrderModel order;

    @Enumerated(EnumType.STRING)
    OrderStatus status;

    LocalDateTime actualFrom;

    boolean actualFlag;
}
