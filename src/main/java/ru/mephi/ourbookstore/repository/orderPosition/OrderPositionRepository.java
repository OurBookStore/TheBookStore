package ru.mephi.ourbookstore.repository.orderPosition;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.OrderPositionModel;

import java.util.List;

@Repository
public interface OrderPositionRepository extends JpaRepository<OrderPositionModel, Long> {

    List<OrderPositionModel> findAllByCartId(Long cartId);


    void deleteAllByCartId(Long id);
}
