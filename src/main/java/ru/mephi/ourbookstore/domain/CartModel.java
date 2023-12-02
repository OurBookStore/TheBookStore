package ru.mephi.ourbookstore.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.*;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @OneToMany(mappedBy = "cart", fetch = FetchType.LAZY)
    @ToString.Exclude
    List<OrderPositionModel> orderPositions;
    @ToString.Exclude
    @OneToOne(mappedBy = "cart")
    AppUserModel appUser;
}
