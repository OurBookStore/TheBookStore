package ru.mephi.ourbookstore.service.orderPosition;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionModelMapper;
import ru.mephi.ourbookstore.repository.order.OrderPositionRepository;
import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.service.book.BookService;
import ru.mephi.ourbookstore.service.exceptions.BookCountException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.service.order.OrderService;

import static ru.mephi.ourbookstore.domain.Entities.ORDER_POSITION;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionService {

    final OrderService orderService;
    final BookService bookService;
    final OrderPositionModelMapper orderModelMapper;
    final OrderPositionRepository orderPositionRepository;
    final OrderRepository orderRepository;


    public OrderPosition getById(long orderPositionId) {
        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        return orderModelMapper.modelToObject(orderPositionModel);
    }

    @Transactional
    public Long addNewOrderPosition(OrderPosition orderPosition) {
        validation(orderPosition);

        orderPosition.setOrder(orderService.getById(orderPosition.getOrder().getId()));
        orderPosition.setBook(bookService.getById(orderPosition.getBook().getId()));
        if (orderPosition.getBook().getCount() < orderPosition.getCount()) {
            throw new BookCountException("count", orderPosition.getCount());
        }
        orderPosition.setPrice(orderPosition.getPrice() * orderPosition.getCount());
        orderPosition.getOrder().setTotalPrice(
                orderPosition.getOrder().getTotalPrice() + orderPosition.getPrice()
        );
        OrderPositionModel orderPositionModel = orderModelMapper.objectToModel(orderPosition);
        orderPositionModel  = orderPositionRepository.save(orderPositionModel);
        return orderPositionModel.getId();
    }

    @Transactional
    public void delete(Long orderPositionId) {
        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        OrderModel orderModel = orderPositionModel.getOrder();
        orderModel.setTotalPrice( orderModel.getTotalPrice() - orderPositionModel.getPrice());
        orderRepository.save(orderModel);
        orderPositionRepository.deleteById(orderPositionId);
    }

    private void validation(OrderPosition orderPosition) {
        int count = orderPosition.getCount();
        if (count <= 0) {
            throw new ValidationException(ORDER_POSITION, "count", count);
        }
    }

}
