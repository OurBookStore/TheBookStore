package ru.mephi.ourbookstore.service.orderStatusHistory;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;

import ru.mephi.ourbookstore.mapper.orderStatusHistory.OrderStatusHistoryModelMapperImpl;
import ru.mephi.ourbookstore.repository.orderStatusHistory.OrderStatusHistoryRepository;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistoryService {

    final OrderStatusHistoryRepository repository;
    final OrderStatusHistoryModelMapperImpl modelMapper;
    @Transactional
    public Long logOrderStatus(Order order, OrderStatus orderStatus) {
        repository.inactivateOldStatusesByOrder(order);

        OrderStatusHistory newOrderStatusHistory = new OrderStatusHistory(order, orderStatus);
        OrderStatusHistoryModel model = modelMapper.objectToModel(newOrderStatusHistory);
        return repository.save(model).getId();
    }

    @Transactional
    public Long logNewOrder(Order order) {
        OrderStatusHistory newOrderStatusHistory = new OrderStatusHistory(order, OrderStatus.CREATED);
        OrderStatusHistoryModel model = modelMapper.objectToModel(newOrderStatusHistory);
        return repository.save(model).getId();
    }
}
