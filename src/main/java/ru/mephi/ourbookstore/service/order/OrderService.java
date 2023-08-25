package ru.mephi.ourbookstore.service.order;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.appUser.AppUserModelMapper;
import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;
import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.service.appUser.AppUserService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

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
        OrderModel newModel = orderModelMapper.objectToModel(order);
        newModel.setAppUser(appUserModelMapper.objectToModel(appUser));
        return orderRepository.save(newModel).getId();
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
