package ru.mephi.ourbookstore.service.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderPosition;
import ru.mephi.ourbookstore.mapper.order.OrderModelMapper;
import ru.mephi.ourbookstore.mapper.order.OrderPositionModelMapper;
import ru.mephi.ourbookstore.repository.order.OrderPositionRepository;
import ru.mephi.ourbookstore.service.book.BookService;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotEnoughPositionsException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

import java.util.UUID;

import static ru.mephi.ourbookstore.domain.Entities.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionService {
    final OrderPositionRepository orderPositionRepository;
    final OrderPositionModelMapper orderPositionModelMapper;

    final OrderModelMapper orderModelMapper;

    BookService bookService;
    OrderService orderService;



    /**
     *  Добавление новой позиции в существующем заказе
     * @param orderPosition - экземпляр создаваемой позиции заказа
     * @return UUID позиции
     */
    //добавить в контроллер айдишник
    @Transactional
    public UUID addNewOrderPosition(OrderPosition orderPosition) {
        validatePosition(orderPosition);
        Order order = orderService.getById(orderPosition.getOrderId());
        if (order == null) {
            throw new NotFoundException(ORDER, "orderId", orderPosition.getOrderId());
        }
        OrderModel orderModel = orderModelMapper.objectToModel(order);
        if (orderPositionRepository.findByOrderAndBookId(orderModel, orderPosition.getBookId()).isPresent()) {
            throw new AlreadyExistException(ORDER_POSITION, "bookId", orderPosition.getBookId());
        }
        OrderPositionModel orderPosModel = orderPositionModelMapper.objectToModel(orderPosition);
        orderPosModel.setOrder(orderModelMapper.objectToModel(order));
        return orderPositionRepository.save(orderPosModel).getId();
    }

    /**
     * Обновление существующей позици
     * @param orderPosition обновленный экземпляр позиции для сохранения в БД
     */
    @Transactional
    public void updateOrderPosition(OrderPosition orderPosition) {
        validatePosition(orderPosition);
        Order order = orderService.getById(orderPosition.getOrderId());
        if (order == null) {
            throw new NotFoundException(ORDER, "orderId", orderPosition.getOrderId());
        }
        UUID orderPositionId = orderPosition.getId();
        orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        OrderPositionModel orderPosModel = orderPositionModelMapper.objectToModel(orderPosition);
        orderPosModel.setOrder(orderModelMapper.objectToModel(order));
        orderPositionRepository.save(orderPosModel);
    }

    protected void checkIfAvailableToAdd(OrderPosition position) throws NotEnoughPositionsException {
        Book book = bookService.getById(position.getBookId());
        if (bookService.getById(position.getBookId()) == null) {
            throw new NotEnoughPositionsException(position, 0);
        }
        if (book.getCount() < position.getCount()) {
            throw new NotEnoughPositionsException(position, book.getCount());
        }
    }


    @Transactional
    public void deletePosition(UUID orderPosId) {
        orderPositionRepository.findById(orderPosId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPosId));
        orderPositionRepository.deleteById(orderPosId);
    }

    protected void validatePosition(OrderPosition position) {
        if (position.getBookId() == null) {
            throw new ValidationException(ORDER_POSITION, "bookId", position.getBookId());
        }
        int count = position.getCount();
        if (count < 0) {
            throw new ValidationException(ORDER_POSITION, "count", count);
        }
    }
}
