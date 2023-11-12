package ru.mephi.ourbookstore.repository.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderModel, Long> {

}
