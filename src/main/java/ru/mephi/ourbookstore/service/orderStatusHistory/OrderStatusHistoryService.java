package ru.mephi.ourbookstore.service.orderStatusHistory;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.Entities;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;

import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;
import ru.mephi.ourbookstore.mapper.orderStatusHistory.OrderStatusHistoryModelMapperImpl;
import ru.mephi.ourbookstore.repository.orderStatusHistory.OrderStatusHistoryRepository;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;

import java.time.LocalDateTime;
import java.util.Optional;

import static ru.mephi.ourbookstore.domain.Entities.ORDER;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistoryService {

    final OrderStatusHistoryRepository repository;
    final OrderStatusHistoryModelMapperImpl oshModelMapper;

    @Transactional
    public OrderStatusHistory writeOrderStatus(Order order, OrderStatus orderStatus) {
        OrderStatusHistory newOrderStatusHistory = OrderStatusHistory.builder()
                .status(orderStatus)
                .order(order)
                .actualFrom(LocalDateTime.now())
                .actualFlag(true)
                .build();
        OrderStatusHistoryModel model = oshModelMapper.objectToModel(newOrderStatusHistory);
        model = repository.save(model);
        return oshModelMapper.modelToObject(model);
    }

    @Transactional
    public void inactivateOldStatus(OrderModel orderModel){
        repository.inactivateOldStatusesByOrder(orderModel);
    }

    public OrderStatusHistory getById(long oshId) {
        OrderStatusHistoryModel model = repository.findById(oshId)
                .orElseThrow(() -> new NotFoundException(Entities.ORDER_STATUS_HISTORY, "id", oshId));
        return oshModelMapper.modelToObject(model);
    }
}
