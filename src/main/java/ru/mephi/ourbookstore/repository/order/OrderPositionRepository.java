package ru.mephi.ourbookstore.repository.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;

import java.util.Optional;

@Repository
public interface OrderPositionRepository extends JpaRepository<OrderPositionModel, Long> {
    Optional<OrderPositionModel> findByOrderAndBookId(OrderModel order, Long bookId);
}