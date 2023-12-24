package ru.mephi.ourbookstore.service.orderStatusHistory;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.Entities;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.OrderStatusHistoryModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;

import ru.mephi.ourbookstore.mapper.orderStatusHistory.OrderStatusHistoryModelMapperImpl;
import ru.mephi.ourbookstore.repository.orderStatusHistory.OrderStatusHistoryRepository;
import ru.mephi.ourbookstore.service.exceptions.NoActualStatusException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatusHistoryService {

    final OrderStatusHistoryRepository repository;
    final OrderStatusHistoryModelMapperImpl oshModelMapper;

    @Transactional
    public OrderStatusHistoryModel writeActualOSH(Order order, OrderStatus orderStatus) {
        OrderStatusHistory osh = OrderStatusHistory.builder()
                .status(orderStatus)
                .order(order)
                .actualFrom(LocalDateTime.now())
                .actualFlag(true)
                .build();

        OrderStatusHistoryModel model = oshModelMapper.objectToModel(osh);
        return repository.save(model);
    }

    public OrderStatusHistory getById(long oshId) {
        OrderStatusHistoryModel model = repository.findById(oshId)
                .orElseThrow(() -> new NotFoundException(Entities.ORDER_STATUS_HISTORY, "id", oshId));
        return oshModelMapper.modelToObject(model);
    }

    @Transactional
    public void inactivateByOrder(OrderModel orderModel) {
        repository.inactivateOldStatusesByOrder(orderModel);
    }

    public OrderStatusHistory getActualByOrder(OrderModel orderModel) {
        return oshModelMapper.modelToObject(repository.getActualByOrder(orderModel)
                .orElseThrow(() -> new NoActualStatusException(Entities.ORDER, "id", orderModel.getId())));
    }
}
