package ru.mephi.ourbookstore.order;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.repository.order.OrderPositionRepository;
import ru.mephi.ourbookstore.repository.order.OrderRepository;

import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
//@SpringBootTest(classes = {BookStoreTest.class})
@ActiveProfiles("test")
@FieldDefaults(level = AccessLevel.PRIVATE)
@SpringBootTest
@AutoConfigureMockMvc
public class OrderTests {

    @Autowired
    MockMvc mockMvc;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    AppUserRepository appUserRepository;

    @Autowired
    OrderPositionRepository orderPositionRepository;

    public OrderModel orderModel;


    @Before
    public void setUp() {
        // mockMvc = MockMvcBuilders.webAppContextSetup().build();
        appUserRepository.save(EntityTestHelper.getTetsAppUserModel(1L));
        orderModel = orderRepository.save(EntityTestHelper.getTestOrderModelWithAppUserModel(1L));
    }


    @Test
    public void getOrder() throws Exception {

        mockMvc.perform(get(String.format("/order/%s", 1)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(2)))
                .andExpect(jsonPath("$.appUserDto.id", is(orderModel.getId())))
                .andExpect(jsonPath("$.appUserDto.nickname", is(orderModel.getAppUser().getNickname())))
                .andExpect(jsonPath("$.appUserDto.email", is(orderModel.getAppUser().getEmail())))
                .andExpect(jsonPath("$.address", is(orderModel.getAddress())))
                .andExpect(jsonPath("$.totalPrice", is(orderModel.getTotalPrice())));
    }
}


