package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(indexes = {
        @Index(columnList = "app_user_id")
})
public class OrderModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    AppUserModel appUser;

    @OneToMany(mappedBy = "order", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @ToString.Exclude
    List<OrderPositionModel> orderPositions;

    @OneToMany(mappedBy = "order")
    @ToString.Exclude
    List<OrderStatusHistoryModel> orderStatusHistories;

    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
    @JoinTable(name = "order_actual_status",
        joinColumns = {@JoinColumn(
                name = "order_id",
                referencedColumnName = "id",
                foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))},
        inverseJoinColumns = {@JoinColumn(
                name = "actual_osh_id",
                referencedColumnName = "id",
                foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))})
    OrderStatusHistoryModel actualOSH;

    String address;

    double totalPrice;
}
