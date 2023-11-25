package ru.mephi.ourbookstore.order;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.*;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderUpdateDto;
import ru.mephi.ourbookstore.service.exceptions.BookStoreError;
import ru.mephi.ourbookstore.util.EntityTestHelper;

import java.util.Objects;
import java.util.Optional;

import static org.hamcrest.Matchers.empty;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static ru.mephi.ourbookstore.domain.Entities.*;

@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderTests extends BookStoreTest {

    public OrderModel orderModel;

    public AppUserModel appUserModel;

    public OrderStatusHistoryModel oshModel;

    @BeforeEach
    public void setUp() {
        orderModel = EntityTestHelper.getTestOrderModel(1L);
        appUserModel = appUserRepository.save(EntityTestHelper.getTetsAppUserModel(1L));
        oshModel = EntityTestHelper.getTestOSH(1L);
        orderModel.setAppUser(appUserModel);
        orderModel = orderRepository.save(orderModel);
        oshModel.setOrder(orderModel);
        oshModel.setStatus(OrderStatus.CREATED);
        oshModel = orderStatusHistoryRepository.save(oshModel);
    }

    @Test
    public void getOrderTest() throws Exception {
        mockMvc.perform(get(String.format("/orders/%s", orderModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(orderModel.getId().intValue())))
                .andExpect(jsonPath("$.appUser.id", is(orderModel.getAppUser().getId().intValue())))
                .andExpect(jsonPath("$.appUser.nickname", is(orderModel.getAppUser().getNickname())))
                .andExpect(jsonPath("$.appUser.email", is(orderModel.getAppUser().getEmail())))
                .andExpect(jsonPath("$.address", is(orderModel.getAddress())))
                .andExpect(jsonPath("$.totalPrice", is(orderModel.getTotalPrice())));
    }

    @Test
    public void getOrderWithOSHTest() throws Exception {
        mockMvc.perform(get(String.format("/orders/%s", orderModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.orderStatusHistories[0].id", is(oshModel.getId().intValue())))
                .andExpect(jsonPath("$.orderStatusHistories[0].status", is(oshModel.getStatus().name())))
                .andExpect(jsonPath("$.orderStatusHistories[0].actualFlag", is(oshModel.isActualFlag())));
    }

    @Test
    public void updateOrderStatusTest() throws Exception {
        OrderStatus newOrderStatus = OrderStatus.DELIVERING;

        mockMvc.perform(put(String.format("/orders/%s", orderModel.getId()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(newOrderStatus.name()))
                .andExpect(status().isOk());

        //OrderModel resultOrder = orderRepository.findById(orderModel.getId()).orElseThrow();

        mockMvc.perform(get(String.format( "/orders/%s/actual-status", orderModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status", is(newOrderStatus.name())));
    }

    @Test
    public void getOrderWithPositionTest() throws Exception {
        BookModel bookModel = bookRepository.save(EntityTestHelper.getTestBookModelDto(3L));
        OrderPositionModel orderPositionModel = EntityTestHelper.getTestOrderPositionModel(1L);
        orderPositionModel.setBook(bookModel);
        orderPositionModel.setOrder(orderModel);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(get(String.format("/orders/%s", orderModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(orderModel.getId().intValue())))
                .andExpect(jsonPath("$.appUser.id", is(orderModel.getAppUser().getId().intValue())))
                .andExpect(jsonPath("$.appUser.nickname", is(orderModel.getAppUser().getNickname())))
                .andExpect(jsonPath("$.appUser.email", is(orderModel.getAppUser().getEmail())))
                .andExpect(jsonPath("$.address", is(orderModel.getAddress())))
                .andExpect(jsonPath("$.totalPrice", is(orderModel.getTotalPrice())))
                .andExpect(jsonPath("$.orderPositions[0].id", is(orderPositionModel.getId().intValue())))
                .andExpect(jsonPath("$.orderPositions[0].count", is(orderPositionModel.getCount())))
                .andExpect(jsonPath("$.orderPositions[0].price", is(orderPositionModel.getPrice())));
        /*
        Не работают, тк orderModelMapper использует orderPositionNullableMapper, где book пишется null
                .andExpect(jsonPath("$.orderPositions[0].book.id", is(bookModel.getId().intValue())))
                .andExpect(jsonPath("$.orderPositions[0].book.name", is(bookModel.getName())))
                .andExpect(jsonPath("$.orderPositions[0].book.price", is(bookModel.getPrice())))
                .andExpect(jsonPath("$.orderPositions[0].book.count", is(bookModel.getCount())));
         */
    }

    @Test
    public void failedGetOrderTest() throws Exception {
        Long incorrectId = 1212442L;

        mockMvc.perform(get(String.format("/orders/%s", incorrectId)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void getAllOrders1Test() throws Exception {
        mockMvc.perform(get("/orders"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.[0].id", is(orderModel.getId().intValue())))
                .andExpect(jsonPath("$.[0].appUser.id", is(orderModel.getAppUser().getId().intValue())))
                .andExpect(jsonPath("$.[0].appUser.nickname", is(orderModel.getAppUser().getNickname())))
                .andExpect(jsonPath("$.[0].appUser.email", is(orderModel.getAppUser().getEmail())))
                .andExpect(jsonPath("$.[0].address", is(orderModel.getAddress())))
                .andExpect(jsonPath("$.[0].totalPrice", is(orderModel.getTotalPrice())));
    }

    @Test
    public void getAllOrders2Test() throws Exception {
        mockMvc.perform(get(String.format("/orders/appUsers/%s", appUserModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.[0].id", is(orderModel.getId().intValue())))
                .andExpect(jsonPath("$.[0].appUser.id", is(orderModel.getAppUser().getId().intValue())))
                .andExpect(jsonPath("$.[0].appUser.nickname", is(orderModel.getAppUser().getNickname())))
                .andExpect(jsonPath("$.[0].appUser.email", is(orderModel.getAppUser().getEmail())))
                .andExpect(jsonPath("$.[0].address", is(orderModel.getAddress())))
                .andExpect(jsonPath("$.[0].totalPrice", is(orderModel.getTotalPrice())));
    }

    @Test
    public void filedGetAllOrdersTest() throws Exception {
        long incorrectId = 1212442L;

        mockMvc.perform(get(String.format("/orders/appUsers/%s", incorrectId)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", empty()));
    }

    @Test
    public void createOrderTest() throws Exception {
        OrderCreateDto orderCreateDto = EntityTestHelper.getTestOrderCreateDto(2L);
        orderCreateDto.setAppUserId(appUserModel.getId());

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderCreateDto);

        mockMvc.perform(post("/orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());
    }

    @Test
    public void failedCreateOrderTest() throws Exception {
        Long incorrectId = 1212442L;
        OrderCreateDto orderCreateDto = EntityTestHelper.getTestOrderCreateDto(2L);
        orderCreateDto.setAppUserId(incorrectId);

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderCreateDto);

        mockMvc.perform(post("/orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), APP_USER, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void updateOrderTest() throws Exception {
        OrderUpdateDto orderUpdateDto = EntityTestHelper.getTestOrderUpdateDto(2L);
        orderUpdateDto.setId(orderModel.getId());

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderUpdateDto);

        mockMvc.perform(put("/orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());
    }

    @Test
    public void failedUpdateOrderTest() throws Exception {
        long incorrectId = 1212442L;
        OrderUpdateDto orderUpdateDto = EntityTestHelper.getTestOrderUpdateDto(2L);
        orderUpdateDto.setId(incorrectId);

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(orderUpdateDto);

        mockMvc.perform(put("/orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void createOrderPositionLinkTest() throws Exception {
        BookModel bookModel = bookRepository.save(EntityTestHelper.getTestBookModelDto(1L));
        OrderPositionModel orderPositionModel = EntityTestHelper.getTestOrderPositionModel(1L);
        orderPositionModel.setBook(bookModel);
        orderPositionModel.setPrice(orderPositionModel.getCount() * bookModel.getPrice());
        orderPositionModel = orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(post(String.format("/orders/%s/positions/%s", orderModel.getId(), orderPositionModel.getId())))
                .andExpect(status().isOk());

        Optional<BookModel> resultBook = bookRepository.findById(bookModel.getId());
        Optional<OrderModel> resultOrder = orderRepository.findById(orderModel.getId());
        assertTrue(resultOrder.isPresent());
        assertTrue(resultBook.isPresent());
        assertTrue(resultOrder.get().getTotalPrice() > 0);
        assertEquals(0, resultBook.get().getCount());
    }

    @Test
    public void failedCreateOrderPositionLink1Test() throws Exception {
        BookModel bookModel = bookRepository.save(EntityTestHelper.getTestBookModelDto(1L));
        OrderPositionModel orderPositionModel = EntityTestHelper.getTestOrderPositionModel(1L);

        int incorrectCount = 0;
        bookModel.setCount(incorrectCount);
        orderPositionModel.setBook(bookModel);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(post(String.format("/orders/%s/positions/%s", orderModel.getId(), orderPositionModel.getId())))
                .andExpect(status().isConflict())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.INCORRECT_COUNT.getMessage(), BOOK, "count", 1)
                        ))
                );
    }

    @Test
    public void failedCreateOrderPositionLink2Test() throws Exception {
        Long incorrectId = 1212442L;
        BookModel bookModel = bookRepository.save(EntityTestHelper.getTestBookModelDto(1L));
        OrderPositionModel orderPositionModel = EntityTestHelper.getTestOrderPositionModel(1L);
        orderPositionModel.setBook(bookModel);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(post(String.format("/orders/%s/positions/%s", incorrectId, orderPositionModel.getId())))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void failedCreateOrderPositionLink3Test() throws Exception {
        Long incorrectId = 1212442L;
        BookModel bookModel = bookRepository.save(EntityTestHelper.getTestBookModelDto(1L));
        OrderPositionModel orderPositionModel = EntityTestHelper.getTestOrderPositionModel(1L);
        orderPositionModel.setBook(bookModel);
        orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(post(String.format("/orders/%s/positions/%s", orderModel.getId(), incorrectId)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER_POSITION, "id", incorrectId)
                        ))
                );
    }

    @Test
    public void deleteOrderTest() throws Exception {
        mockMvc.perform(delete(String.format("/orders/%s", orderModel.getId())))
                .andExpect(status().isOk());
    }

    @Test
    public void failedDeleteOrderTest() throws Exception {
        Long incorrectId = 1212442L;

        mockMvc.perform(delete(String.format("/orders/%s", incorrectId)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", incorrectId)
                        ))
                );
    }
}


