package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
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
public class CustomerModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String nickname;
    String email;
    String password;

    @OneToMany(mappedBy = "customers", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    List<OrderModel> orders;
}
