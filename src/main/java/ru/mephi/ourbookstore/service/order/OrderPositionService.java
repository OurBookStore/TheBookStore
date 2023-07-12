package ru.mephi.ourbookstore.service.order;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.order.OrderPosition;
import ru.mephi.ourbookstore.mapper.order.OrderPositionModelMapper;
import ru.mephi.ourbookstore.repository.order.OrderPositionRepository;
import ru.mephi.ourbookstore.service.book.BookService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

import java.util.List;

import static ru.mephi.ourbookstore.domain.Entities.ORDER_POSITION;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionService {
    final OrderPositionRepository orderPositionRepository;
    final OrderPositionModelMapper orderPositionModelMapper;

    private BookService bookService;

    public OrderPosition getById(long orderPosId) {
        OrderPositionModel orderPosModel = orderPositionRepository.findById(orderPosId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPosId));
        return orderPositionModelMapper.modelToObject(orderPosModel);
    }

    public List<OrderPosition> getAll() {
        return orderPositionRepository.findAll().stream()
                .map(orderPositionModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public Long createOrUpdate(OrderPosition orderPosition) {
        validate(orderPosition);
        OrderPositionModel newModel = orderPositionModelMapper.objectToModel(orderPosition);
        if (orderPositionRepository.findByOrderAndBookId(newModel.getOrder(), newModel.getBookId()).isPresent()) {
            orderPositionRepository.deleteById(newModel.getId());
        }
        return orderPositionRepository.save(newModel).getId();
    }


    @Transactional
    public void delete(Long orderPosId) {
        orderPositionRepository.findById(orderPosId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPosId));
        orderPositionRepository.deleteById(orderPosId);
    }

    private void validate(OrderPosition orderPosition) {
        Book book = bookService.getById(orderPosition.getBookId());
        if (book == null) {
            throw new NotFoundException(ORDER_POSITION, "bookId", orderPosition.getBookId());
        }
        int count = orderPosition.getCount();
        if (count < 0 || count > book.getCount()) {
            throw new ValidationException(ORDER_POSITION, "count", count);
        }
        if(orderPosition.getOrder() == null){
            throw new ValidationException(ORDER_POSITION, "order", orderPosition.getOrder());
        }
        //order validation??

    }
}
