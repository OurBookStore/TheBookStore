package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(indexes = {
        @Index(columnList = "keycloak_id")
})
public class AppUserModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String nickname;
    String email;
    String password;
    @Column(unique = true,name = "keycloak_id")
    String keycloakId;
    @OneToMany(mappedBy = "appUser", fetch = FetchType.LAZY)
    @ToString.Exclude
    List<OrderModel> orders;
    @OneToOne(cascade = CascadeType.ALL)
    @ToString.Exclude
    CartModel cart;
}
