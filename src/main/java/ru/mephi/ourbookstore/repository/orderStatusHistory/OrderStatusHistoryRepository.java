package ru.mephi.ourbookstore.repository.orderStatusHistory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;

import java.util.Optional;

@Repository
public interface OrderStatusHistoryRepository extends JpaRepository<OrderStatusHistoryModel, Long> {
    @Query("SELECT osh FROM OrderStatusHistoryModel osh WHERE osh.order = :order AND osh.actualFlag = true")
    Optional<OrderStatusHistoryModel> findActualByOrder(@Param("order") OrderModel order);

    @Modifying
    @Query("UPDATE OrderStatusHistoryModel osh SET osh.actualFlag = false WHERE osh.order = :order")
    void inactivateOldStatusesByOrder(@Param("order") OrderModel order);
}
