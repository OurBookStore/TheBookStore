package ru.mephi.ourbookstore.order;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import ru.mephi.ourbookstore.controller.order.OrderController;
import ru.mephi.ourbookstore.repository.order.OrderPositionRepository;
import ru.mephi.ourbookstore.repository.order.OrderRepository;

@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderTests {
    @Autowired
    OrderController orderController;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderPositionRepository orderPositionRepository;


}
