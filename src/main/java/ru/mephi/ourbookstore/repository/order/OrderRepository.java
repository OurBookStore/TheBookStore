package ru.mephi.ourbookstore.repository.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.CustomerModel;
import ru.mephi.ourbookstore.domain.OrderModel;

import java.util.List;
import java.util.UUID;


@Repository
public interface OrderRepository extends JpaRepository<OrderModel, UUID> {

    List<OrderModel> findAllByCustomer(CustomerModel customerModel);
}

