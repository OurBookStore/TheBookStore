package ru.mephi.ourbookstore.service.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;

import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.service.customer.CustomerService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static ru.mephi.ourbookstore.domain.Entities.*;


@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderService {

    final OrderRepository orderRepository;
    final OrderModelMapper orderModelMapper;

    private CustomerService customerService;


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

    public List<Order> getAllByCustomerId(Long customerId){
        return orderRepository.findAllByCustomerId(customerId).stream()
                .map(orderModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public void createOrderOrUpdateExisting(Order order) {
        validate(order);
        OrderModel newModel = orderModelMapper.objectToModel(order);
        Optional<OrderModel> existingModel = orderRepository.findById(order.getId());
        if (existingModel.isPresent()) {
            orderRepository.deleteById(order.getId());
        }
        orderRepository.save(newModel);
    }

    @Transactional
    public void deleteOrder(long orderId) {
        orderRepository.findById(orderId)
                .orElseThrow(() -> new NotFoundException(ORDER, "id", orderId));
        orderRepository.deleteById(orderId);
    }

    private void validate(Order order) {
        Customer customer = customerService.getById(order.getCustomerId());
        if (customer == null) {
            throw new NotFoundException(ORDER, "customerId", order.getCustomerId());
        }
        if (order.getCreatedDate().isAfter(LocalDateTime.now())) {
            throw new ValidationException(ORDER, "createdDateTime", order.getCreatedDate());
        }

    }
}
