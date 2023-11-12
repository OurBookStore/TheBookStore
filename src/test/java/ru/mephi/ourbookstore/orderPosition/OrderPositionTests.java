package ru.mephi.ourbookstore.orderPosition;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionUpdateDto;
import ru.mephi.ourbookstore.service.exceptions.BookStoreError;
import ru.mephi.ourbookstore.util.TestHelper;

import java.util.Objects;
import java.util.Optional;

import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static ru.mephi.ourbookstore.domain.Entities.BOOK;
import static ru.mephi.ourbookstore.domain.Entities.ORDER_POSITION;

@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionTests extends BookStoreTest {

    public OrderModel orderModel;

    public OrderPositionModel orderPositionModel;

    public BookModel bookModel;

    @BeforeEach
    public void setUp() {
        orderModel = TestHelper.OrderEntity.getOrderModel(1L);
        orderModel.setAppUser(appUserRepository.save(TestHelper.AppUserEntity.getTetsAppUserModel(1L)));
        orderModel = orderRepository.save(orderModel);

        bookModel = bookRepository.save(TestHelper.BookEntity.getBookModelDto(3L));
        orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);
        orderPositionModel.setPrice(orderPositionModel.getCount() * bookModel.getPrice());
        orderModel.setTotalPrice(orderPositionModel.getPrice());
        orderPositionModel.setBook(bookModel);
        orderPositionModel.setOrder(orderModel);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);
    }

    @Test
    public void getOrderPositionTest() throws Exception {
        mockMvc.perform(get(String.format("/positions/%s", orderPositionModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(orderPositionModel.getId().intValue())))
                .andExpect(jsonPath("$.count", is(orderPositionModel.getCount())))
                .andExpect(jsonPath("$.price", is(orderPositionModel.getPrice())))
                .andExpect(jsonPath("$.orderId", is(orderModel.getId().intValue())))
                .andExpect(jsonPath("$.book.id", is(bookModel.getId().intValue())))
                .andExpect(jsonPath("$.book.name", is(bookModel.getName())))
                .andExpect(jsonPath("$.book.price", is(bookModel.getPrice())))
                .andExpect(jsonPath("$.book.count", is(bookModel.getCount())));
    }

    @Test
    public void failedGetOrderPositionTest() throws Exception {
        Long incorrectId = 1212442L;

        mockMvc.perform(get(String.format("/positions/%s", incorrectId)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER_POSITION, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void createOrderPositionTest() throws Exception {
        OrderPositionCreateDto orderPositionCreateDto =
                TestHelper.OrderPositionEntity.getOrderPositionCreateDto(1L);
        orderPositionCreateDto.setBookId(bookModel.getId());

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderPositionCreateDto);

        mockMvc.perform(post("/positions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());
    }

    @Test
    public void failedCreateOrderPositionTest() throws Exception {
        Long incorrectId = 1212442L;
        OrderPositionCreateDto orderPositionCreateDto =
                TestHelper.OrderPositionEntity.getOrderPositionCreateDto(1L);
        orderPositionCreateDto.setBookId(incorrectId);

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderPositionCreateDto);

        mockMvc.perform(post("/positions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), BOOK, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void updateOrderPositionTest() throws Exception {
        OrderPositionUpdateDto orderPositionUpdateDto =
                TestHelper.OrderPositionEntity.getOrderPositionUpdateDto(4L);
        orderPositionUpdateDto.setId(orderPositionModel.getId());

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderPositionUpdateDto);

        mockMvc.perform(put("/positions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());

        Optional<BookModel> updatedBookModel = bookRepository.findById(bookModel.getId());
        Optional<OrderModel> resultOrder = orderRepository.findById(orderModel.getId());
        assertTrue(resultOrder.isPresent());
        assertTrue(updatedBookModel.isPresent());
        assertEquals(4 * bookModel.getPrice(), resultOrder.get().getTotalPrice());
        assertEquals(0, updatedBookModel.get().getCount());
    }

    @Test
    public void updateOrderPosition2Test() throws Exception {
        OrderPositionModel orderPositionModelNotLinkedToOrder =
                TestHelper.OrderPositionEntity.getOrderPositionModel(2L);
        orderPositionModelNotLinkedToOrder.setBook(bookModel);
        orderPositionModelNotLinkedToOrder = orderPositionRepository.save(orderPositionModelNotLinkedToOrder);

        OrderPositionUpdateDto orderPositionUpdateDto =
                TestHelper.OrderPositionEntity.getOrderPositionUpdateDto(1L);
        orderPositionUpdateDto.setId(orderPositionModelNotLinkedToOrder.getId());
        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderPositionUpdateDto);

        mockMvc.perform(put("/positions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());

        Optional<BookModel> updatedBookModel = bookRepository.findById(bookModel.getId());
        Optional<OrderModel> resultOrder = orderRepository.findById(orderModel.getId());
        assertTrue(resultOrder.isPresent());
        assertTrue(updatedBookModel.isPresent());
        assertEquals(orderModel.getTotalPrice(), resultOrder.get().getTotalPrice());
        assertEquals(bookModel.getCount(), updatedBookModel.get().getCount());
    }

    @Test
    public void failedUpdateOrderPosition1Test() throws Exception {
        Long incorrectId = 1212442L;
        OrderPositionUpdateDto orderPositionUpdateDto =
                TestHelper.OrderPositionEntity.getOrderPositionUpdateDto(2L);
        orderPositionUpdateDto.setId(incorrectId);

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderPositionUpdateDto);

        mockMvc.perform(put("/positions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER_POSITION, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void failedUpdateOrderPosition2Test() throws Exception {
        OrderPositionUpdateDto orderPositionUpdateDto =
                TestHelper.OrderPositionEntity.getOrderPositionUpdateDto(5L);
        orderPositionUpdateDto.setId(orderPositionModel.getId());

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderPositionUpdateDto);

        mockMvc.perform(put("/positions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isConflict())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.INCORRECT_COUNT.getMessage(), BOOK, "count", 5)
                        ))
                );

    }

    @Test
    public void deleteOrderPositionTest() throws Exception {
        mockMvc.perform(delete(String.format("/positions/%s", orderPositionModel.getId())))
                .andExpect(status().isOk());

        Optional<BookModel> updatedBookModel = bookRepository.findById(bookModel.getId());
        Optional<OrderModel> resultOrder = orderRepository.findById(orderModel.getId());
        assertTrue(resultOrder.isPresent());
        assertTrue(updatedBookModel.isPresent());
        assertEquals(0, resultOrder.get().getTotalPrice());
        assertEquals(bookModel.getCount() + 1, updatedBookModel.get().getCount());
    }

    @Test
    public void failedDeleteOrderPositionTest() throws Exception {
        Long incorrectId = 1212442L;

        mockMvc.perform(delete(String.format("/positions/%s", incorrectId)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER_POSITION, "id", incorrectId)
                        ))
                );
    }
}
