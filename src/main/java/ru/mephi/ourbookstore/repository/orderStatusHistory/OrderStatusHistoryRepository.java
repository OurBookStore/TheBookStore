package ru.mephi.ourbookstore.repository.orderStatusHistory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;

@Repository
public interface OrderStatusHistoryRepository extends JpaRepository<OrderStatusHistoryModel, Long> {
    @Query("SELECT osh FROM OrderStatusHistoryModel osh WHERE osh.order = :order AND osh.isActual = true")
    OrderStatusHistoryModel findActualByOrder(@Param("order") Order order);

    @Modifying
    @Query("UPDATE OrderStatusHistoryModel osh SET osh.isActual = false WHERE osh.order = :order")
    void inactivateOldStatusesByOrder(@Param("order") Order order);
}
