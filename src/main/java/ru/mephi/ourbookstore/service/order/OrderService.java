package ru.mephi.ourbookstore.service.order;


import jakarta.persistence.Query;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderStatus;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusHistory;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelMapper;
import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;
import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.service.appUser.AppUserService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.service.orderStatusHistory.OrderStatusHistoryService;

import java.util.List;

import static ru.mephi.ourbookstore.domain.Entities.APP_USER;
import static ru.mephi.ourbookstore.domain.Entities.ORDER;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderService {

    final OrderRepository orderRepository;
    final OrderModelMapper orderModelMapper;
    final AppUserService appUserService;
    final AppUserModelMapper appUserModelMapper;
    final OrderStatusHistoryService orderStatusHistoryService;

    public Order getById(long orderId) {
        OrderModel orderModel = orderRepository.findById(orderId)
                .orElseThrow(() -> new NotFoundException(ORDER, "id", orderId));
        return orderModelMapper.modelToObject(orderModel);
    }

    public List<Order> getAll() {
        return orderRepository.findAll().stream()
                .map(orderModelMapper::modelToObject)
                .toList();
    }

    public List<Order> getAll(Long appUserId) {
        return orderRepository.findAll().stream()
                .filter(orderModel -> orderModel.getAppUser().getId().equals(appUserId))
                .map(orderModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public Long create(Order order) {
        validation(order);
        AppUser appUser = appUserService.getById(order.getAppUser().getId());
        if (appUser == null) {
            throw new NotFoundException(APP_USER, "appUserId", order.getAppUser().getId());
        }

        OrderModel newOrderModel = orderModelMapper.objectToModel(order);
        newOrderModel.setAppUser(appUserModelMapper.objectToModel(appUser));
        newOrderModel = orderRepository.save(newOrderModel);

        order = orderModelMapper.modelToObject(newOrderModel);

        OrderStatusHistory actualOSH = orderStatusHistoryService.writeOrderStatus(order, OrderStatus.CREATED);
        order.setActualOSH(actualOSH);
        newOrderModel = orderModelMapper.objectToModel(order);
        orderRepository.save(newOrderModel);

        return newOrderModel.getId();
    }

    @Transactional
    public Long update(Order order) {
        validation(order);
        Order updateOrder = getById(order.getId());
        updateOrder.setAddress(order.getAddress());
        OrderModel newModel = orderModelMapper.objectToModel(updateOrder);
        return orderRepository.save(newModel).getId();
    }

    @Transactional
    public Long updateOrderStatus(Long orderId, OrderStatus orderStatus) {
        Order order = getById(orderId);
        OrderModel orderModel = orderModelMapper.objectToModel(order);
        orderStatusHistoryService.inactivateOldStatus(orderModel);
        return orderStatusHistoryService.writeOrderStatus(order, orderStatus).getId();
    }

    @Transactional
    public void delete(Long orderId) {
        orderRepository.findById(orderId)
                .orElseThrow(() -> new NotFoundException(ORDER, "id", orderId));
        orderRepository.deleteById(orderId);
    }

    private void validation(Order order) {
        String address = order.getAddress();
        if (address == null || address.isBlank()) {
            throw new ValidationException(ORDER, "address", address);
        }
    }

}
