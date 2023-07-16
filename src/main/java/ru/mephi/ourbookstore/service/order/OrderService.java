package ru.mephi.ourbookstore.service.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;

import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.service.customer.CustomerService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import java.time.LocalDateTime;
import java.util.List;

import static ru.mephi.ourbookstore.domain.Entities.*;


@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderService {

    final OrderRepository orderRepository;
    final OrderModelMapper orderModelMapper;

    CustomerService customerService;


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

    public List<Order> getAllByCustomerId(Long customerId) {
        return orderRepository.findAllByCustomerId(customerId).stream()
                .map(orderModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public Long createOrder(Order order) {
        validate(order);
        OrderModel newModel = orderModelMapper.objectToModel(order);
        return orderRepository.save(newModel).getId();
    }

    @Transactional
    public void updateOrder(Order order) {
        Long orderId = order.getId();
        orderRepository.findById(orderId)
                .orElseThrow(() -> new NotFoundException(ORDER, "id", orderId));
        OrderModel orderModel = orderModelMapper.objectToModel(order);
        orderRepository.save(orderModel);
    }

    @Transactional
    public void deleteOrder(long orderId) {
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
        if (order.getCreatedDate().isAfter(LocalDateTime.now())) {
            throw new ValidationException(ORDER, "createdDateTime", order.getCreatedDate());
        }
    }
}
