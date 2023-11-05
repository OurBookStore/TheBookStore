package ru.mephi.ourbookstore.service.orderStatusHistory;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;

import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;
import ru.mephi.ourbookstore.mapper.orderStatusHistory.OrderStatusHistoryModelMapperImpl;
import ru.mephi.ourbookstore.repository.orderStatusHistory.OrderStatusHistoryRepository;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistoryService {

    final OrderStatusHistoryRepository repository;
    final OrderStatusHistoryModelMapperImpl oshModelMapper;
    @Transactional
    public Long writeOrderStatus(Order order, OrderStatus orderStatus) {
        OrderStatusHistory newOrderStatusHistory = OrderStatusHistory.builder()
                .status(orderStatus)
                .order(order)
                .actualFrom(LocalDateTime.now())
                .actualFlag(true)
                .build();
        OrderStatusHistoryModel model = oshModelMapper.objectToModel(newOrderStatusHistory);
        return repository.save(model).getId();
    }

    @Transactional
    public void inactivateOldStatus(OrderModel orderModel){
        repository.inactivateOldStatusesByOrder(orderModel);
    }

    @Transactional
    public Long writeNewOrderStatus(Order order) {
        OrderStatusHistory newOrderStatusHistory = OrderStatusHistory.builder()
                .status(OrderStatus.CREATED)
                .order(order)
                .actualFrom(LocalDateTime.now())
                .actualFlag(true)
                .build();
        OrderStatusHistoryModel model = oshModelMapper.objectToModel(newOrderStatusHistory);
        return repository.save(model).getId();
    }
}
