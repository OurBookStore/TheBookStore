package ru.mephi.ourbookstore.repository.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.OrderModel;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderModel, Long> {

}
