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
import ru.mephi.ourbookstore.domain.dto.orderStatusHistory.OrderStatusDto;
import ru.mephi.ourbookstore.service.exceptions.BookStoreError;
import ru.mephi.ourbookstore.util.TestHelper;

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

    private final long INCORRECT_ID = 1212442L;

    private final long ID_1 = 1L;
    private final long ID_2 = 2L;

    @BeforeEach
    public void setUp() {
        orderModel = TestHelper.OrderEntity.getOrderModel(ID_1);
        appUserModel = appUserRepository.save(TestHelper.AppUserEntity.getTetsAppUserModel(1L));
        oshModel = TestHelper.OrderEntity.getTestOSH(ID_1);
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
        OrderStatusDto newOrderStatusDto = new OrderStatusDto(OrderStatus.DELIVERING);

        String content = new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter()
                .writeValueAsString(newOrderStatusDto);

        mockMvc.perform(put(String.format("/orders/%s", orderModel.getId()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());

        mockMvc.perform(get(String.format("/orders/%s/actual-status", orderModel.getId())))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status", is(newOrderStatusDto.getOrderStatus().name())));
    }

    @Test
    public void failedOrderWithNoStatusTest() throws Exception {
        OrderModel newOrder = orderRepository.save(TestHelper.OrderEntity.getOrderModel(ID_2));

        mockMvc.perform(get(String.format("/orders/%s/actual-status", newOrder.getId())))
                .andExpect(result ->
                        assertTrue((Objects.requireNonNull(result.getResolvedException())
                                .getMessage()
                                .contains(String.format(BookStoreError.NO_ACTUAL_STATUS.getMessage(), ORDER, "id", newOrder.getId())))));

    }

    @Test
    public void fillOrderPositionTest() throws Exception {
        BookModel bookModel = bookRepository.save(TestHelper.BookEntity.getBookModel1());
        OrderPositionModel orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);
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
    }

    @Test
    public void getOrderWithPositionTest() throws Exception {
        BookModel bookModel = bookRepository.save(TestHelper.BookEntity.getBookModel1());
        OrderPositionModel orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);
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
    }

    @Test
    public void failedGetOrderTest() throws Exception {
        mockMvc.perform(get(String.format("/orders/%s", INCORRECT_ID)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", INCORRECT_ID)
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
        mockMvc.perform(get(String.format("/orders/appUsers/%s", INCORRECT_ID)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", empty()));
    }

    @Test
    public void createOrderTest() throws Exception {
        OrderCreateDto orderCreateDto = TestHelper.OrderEntity.getOrderCreateDto(ID_2);
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
        OrderCreateDto orderCreateDto = TestHelper.OrderEntity.getOrderCreateDto(ID_2);
        orderCreateDto.setAppUserId(INCORRECT_ID);

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
                                String.format(BookStoreError.NOT_FOUND.getMessage(), APP_USER, "id", INCORRECT_ID)
                        ))
                );
    }

    @Test
    public void updateOrderTest() throws Exception {
        OrderUpdateDto orderUpdateDto = TestHelper.OrderEntity.getOrderUpdateDto(ID_2);
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
        OrderUpdateDto orderUpdateDto = TestHelper.OrderEntity.getOrderUpdateDto(ID_2);
        orderUpdateDto.setId(INCORRECT_ID);

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
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", INCORRECT_ID)
                        ))
                );
    }

    @Test
    public void createOrderPositionLinkTest() throws Exception {
        BookModel bookModel = bookRepository.save(TestHelper.BookEntity.getBookModel1());
        OrderPositionModel orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);
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
        BookModel bookModel = bookRepository.save(TestHelper.BookEntity.getBookModel1());
        OrderPositionModel orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);

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
        BookModel bookModel = bookRepository.save(TestHelper.BookEntity.getBookModel1());
        OrderPositionModel orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);
        orderPositionModel.setBook(bookModel);
        orderPositionModel = orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(post(String.format("/orders/%s/positions/%s", INCORRECT_ID, orderPositionModel.getId())))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", INCORRECT_ID)
                        ))
                );
    }

    @Test
    public void failedCreateOrderPositionLink3Test() throws Exception {
        BookModel bookModel = bookRepository.save(TestHelper.BookEntity.getBookModel1());
        OrderPositionModel orderPositionModel = TestHelper.OrderPositionEntity.getOrderPositionModel(1L);
        orderPositionModel.setBook(bookModel);
        orderPositionRepository.save(orderPositionModel);

        mockMvc.perform(post(String.format("/orders/%s/positions/%s", orderModel.getId(), INCORRECT_ID)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER_POSITION, "id", INCORRECT_ID)
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
        mockMvc.perform(delete(String.format("/orders/%s", INCORRECT_ID)))
                .andExpect(status().isNotFound())
                .andExpect(result ->
                        assertTrue(Objects.requireNonNull(result.getResolvedException()).getMessage().contains(
                                String.format(BookStoreError.NOT_FOUND.getMessage(), ORDER, "id", INCORRECT_ID)
                        ))
                );
    }
}


