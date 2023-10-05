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
public class AppUserModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String nickname;
    String email;
    String password;
    String keycloakId;
    @OneToMany(mappedBy = "appUser", fetch = FetchType.LAZY)
    @ToString.Exclude
    List<OrderModel> orders;
}
