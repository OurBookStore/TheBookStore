package ru.mephi.ourbookstore.repository.cart;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.CartModel;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Repository
public interface CartRepository extends JpaRepository<CartModel, Long> {

    Optional<CartModel> findCartModelByAppUserId(Long appUserId);
}
