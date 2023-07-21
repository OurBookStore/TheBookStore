package ru.mephi.ourbookstore.service.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.customer.CustomerModelMapper;
import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;
import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.service.customer.CustomerService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import static ru.mephi.ourbookstore.domain.Entities.*;


@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderService {

    final OrderRepository orderRepository;
    final OrderModelMapper orderModelMapper;
    final CustomerModelMapper customerModelMapper;

    final CustomerService customerService;

    final OrderPositionService orderPositionService;


    public Order getById(UUID orderId) {
        OrderModel orderModel = orderRepository.findById(orderId)
                .orElseThrow(() -> new NotFoundException(ORDER, "id", orderId));
        return orderModelMapper.modelToObject(orderModel);
    }


    public List<Order> getAll() {
        return orderRepository.findAll().stream()
                .map(orderModelMapper::modelToObject)
                .toList();
    }

    public List<Order> getAllByCustomer(long customerId) {
        Customer customer = customerService.getById(customerId);
        if (customer == null) {
            throw new NotFoundException(CUSTOMER, "customerId", customerId);
        }
        return orderRepository.findAllByCustomer(customerModelMapper.objectToModel(customer)).stream()
                .map(orderModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public UUID createOrder(Order order) {
        validate(order);
        Customer customer = customerService.getById(order.getCustomerId());
        if (customer == null) {
            throw new NotFoundException(CUSTOMER, "customerId", order.getCustomerId());
        }
        OrderModel newModel = orderModelMapper.objectToModel(order);
        newModel.setCustomer(customerModelMapper.objectToModel(customer));
        newModel.getBooksInOrder().forEach(orderPositionModel -> orderPositionModel.setOrder(newModel));
        return orderRepository.save(newModel).getId();
    }

    @Transactional
    public void updateOrder(Order order) {
        validate(order);
        Customer customer = customerService.getById(order.getCustomerId());
        if (customer == null) {
            throw new NotFoundException(CUSTOMER, "customerId", order.getCustomerId());
        }
        OrderModel oldModel = orderRepository.findById(order.getId())
                .orElseThrow(() -> new NotFoundException(ORDER, "id", order.getId()));
        order.setCreatedDateTime(oldModel.getCreatedDateTime());
        OrderModel updatedOrder = orderModelMapper.objectToModel(order);
        updatedOrder.setCustomer(customerModelMapper.objectToModel(customer));
        updatedOrder.getBooksInOrder().forEach(orderPositionModel -> orderPositionModel.setOrder(updatedOrder));
        orderRepository.save(updatedOrder);
    }

    @Transactional
    public void deleteOrder(UUID orderId) {
        orderRepository.findById(orderId)
                .orElseThrow(() -> new NotFoundException(ORDER, "id", orderId));
        orderRepository.deleteById(orderId);
    }

    private void validate(Order order) {
        if (order.getCustomerId() == null) {
            throw new ValidationException(ORDER, "customer", order.getCustomerId());
        }
        if (order.getBooksInOrder() == null) {
            throw new ValidationException(ORDER, "booksInOrder", order.getBooksInOrder());
        }
        if (order.getCreatedDateTime() == null || order.getCreatedDateTime().isAfter(LocalDateTime.now())) {
            throw new ValidationException(ORDER, "createdDateTime", order.getCreatedDateTime());
        }
        order.getBooksInOrder().forEach(orderPositionService::validatePosition);
    }

}
