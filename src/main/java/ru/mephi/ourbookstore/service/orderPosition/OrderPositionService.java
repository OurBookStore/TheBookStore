package ru.mephi.ourbookstore.service.orderPosition;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.CartModel;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.cart.Cart;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionLink;
import ru.mephi.ourbookstore.mapper.cart.CartModelMapper;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionModelMapper;
import ru.mephi.ourbookstore.repository.orderPosition.OrderPositionRepository;
import ru.mephi.ourbookstore.service.book.BookService;
import ru.mephi.ourbookstore.service.cart.CartService;
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
    final CartService cartService;
    final OrderPositionModelMapper orderModelMapper;
    final CartModelMapper cartModelMapper;
    final OrderPositionRepository orderPositionRepository;

    public OrderPosition getById(long orderPositionId) {
        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        return orderModelMapper.modelToObject(orderPositionModel);
    }

    @Transactional
    public Long create(OrderPosition orderPosition) {
        validation(orderPosition);

        orderPosition.setBook(bookService.getById(orderPosition.getBook().getId()));
        if (orderPosition.getBook().getCount() < orderPosition.getCount()) {
            throw new BookCountException("count", orderPosition.getCount());
        }
        orderPosition.setPrice(orderPosition.getBook().getPrice() * orderPosition.getCount());
        OrderPositionModel orderPositionModel = orderModelMapper.objectToModel(orderPosition);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);
        return orderPositionModel.getId();
    }

    @Transactional
    public Long createLinkToOrder(OrderPositionLink orderPositionLink) {
        OrderPosition orderPosition = getById(orderPositionLink.getPositionId());
        orderPosition.setOrder(orderService.getById(orderPositionLink.getOrderId()));

        if (orderPosition.getBook().getCount() < orderPosition.getCount()) {
            throw new BookCountException("count", orderPosition.getCount());
        }
        orderPosition.getBook().setCount(
                orderPosition.getBook().getCount() - orderPosition.getCount()
        );
        orderPosition.getOrder().setTotalPrice(
                orderPosition.getOrder().getTotalPrice() + orderPosition.getPrice()
        );
        OrderPositionModel orderPositionModel = orderModelMapper.objectToModel(orderPosition);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);
        return orderPositionModel.getOrder().getId();
    }

    @Transactional
    public Long update(OrderPosition orderPosition) {
        validation(orderPosition);

        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPosition.getId())
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPosition.getId()));

        int tempCount = orderPositionModel.getCount();
        orderPositionModel.setCount(orderPosition.getCount());
        orderPositionModel.setPrice(orderPositionModel.getBook().getPrice() * orderPosition.getCount());

        if (orderPositionModel.getOrder() != null) {
            BookModel book = orderPositionModel.getBook();
            OrderModel order = orderPositionModel.getOrder();
            if ((book.getCount() + tempCount) < orderPosition.getCount()) {
                throw new BookCountException("count", orderPosition.getCount());
            }
            book.setCount(
                    book.getCount() + tempCount - orderPositionModel.getCount()
            );
            order.setTotalPrice(
                    order.getTotalPrice() - (tempCount * book.getPrice()) + orderPositionModel.getPrice()
            );

            orderPositionModel.setBook(book);
            orderPositionModel.setOrder(order);
        }

        orderPositionRepository.save(orderPositionModel);
        return orderPositionModel.getId();
    }

    @Transactional
    public void delete(Long orderPositionId) {
        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        if (orderPositionModel.getOrder() != null) {
            orderPositionModel.getOrder().setTotalPrice(
                    orderPositionModel.getOrder().getTotalPrice() - orderPositionModel.getPrice()
            );
            orderPositionModel.getBook().setCount(
                    orderPositionModel.getBook().getCount() + orderPositionModel.getCount()
            );
            orderPositionRepository.save(orderPositionModel);
        }
        orderPositionRepository.deleteById(orderPositionId);
    }

    public void addToCart(long orderPositionId, long cartId) {
        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        Cart cart = cartService.getById(cartId);
        CartModel cartModel = cartModelMapper.objectToModel(cart);
        orderPositionModel.setCart(cartModel);
        orderPositionRepository.save(orderPositionModel);
    }

    public void removeFromCart(long orderPositionId) {
        OrderPositionModel orderPositionModel = orderPositionRepository.findById(orderPositionId)
                .orElseThrow(() -> new NotFoundException(ORDER_POSITION, "id", orderPositionId));
        orderPositionModel.setCart(null);
        orderPositionRepository.save(orderPositionModel);
    }

    private void validation(OrderPosition orderPosition) {
        int count = orderPosition.getCount();
        if (count <= 0) {
            throw new ValidationException(ORDER_POSITION, "count", count);
        }
    }

}
