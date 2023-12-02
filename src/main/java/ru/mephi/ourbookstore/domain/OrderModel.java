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
    @ToString.Exclude
    AppUserModel appUser;
    @OneToMany(mappedBy = "order", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @ToString.Exclude
    List<OrderPositionModel> orderPositions;
    @OneToMany(mappedBy = "order")
    @ToString.Exclude
    List<OrderStatusHistoryModel> orderStatusHistoryList;
    String address;
    double totalPrice;
}
