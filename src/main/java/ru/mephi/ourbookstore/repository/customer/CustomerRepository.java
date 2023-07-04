package ru.mephi.ourbookstore.repository.customer;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.CustomerModel;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Repository
public interface CustomerRepository extends JpaRepository<CustomerModel, Long> {

    Optional<CustomerModel> findByNickname(String nickname);
    Optional<CustomerModel> findByEmail(String email);
}
