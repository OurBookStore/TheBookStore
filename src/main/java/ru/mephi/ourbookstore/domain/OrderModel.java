package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.UUID;

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
    @GeneratedValue(strategy = GenerationType.UUID)
    UUID id;
    @ManyToOne
    AppUserModel appUser;
    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    List<OrderPositionModel> orderPositions;
    String address;
    double totalPrice;
    double totalTax;
}
