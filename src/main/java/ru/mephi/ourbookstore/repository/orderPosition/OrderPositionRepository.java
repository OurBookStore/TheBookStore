package ru.mephi.ourbookstore.repository.orderPosition;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.OrderPositionModel;

@Repository
public interface OrderPositionRepository extends JpaRepository<OrderPositionModel, Long> {
}
