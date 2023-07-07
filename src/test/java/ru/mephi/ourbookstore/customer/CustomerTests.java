package ru.mephi.ourbookstore.customer;

import java.util.List;
import java.util.Optional;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.controller.customer.CustomerController;
import ru.mephi.ourbookstore.domain.CustomerModel;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerRqDto;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerRsDto;
import ru.mephi.ourbookstore.repository.customer.CustomerRepository;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CustomerTests extends BookStoreTest {

    @Autowired
    CustomerController customerController;
    @Autowired
    CustomerRepository customerRepository;

    final CustomerModel CUSTOMER_CORRECT_1 = CustomerModel.builder()
            .id(1L)
            .nickname("1")
            .email("1")
            .password("1")
            .build();

    final CustomerModel CUSTOMER_CORRECT_2 = CustomerModel.builder()
            .id(2L)
            .nickname("2")
            .email("2")
            .password("2")
            .build();

    final CustomerRqDto CUSTOMER_DTO = CustomerRqDto.builder()
            .id(3L)
            .nickname("3")
            .email("3")
            .password("3")
            .build();

    final CustomerRqDto CUSTOMER_DTO_INCORRECT_EMAIl_1 = CustomerRqDto.builder()
            .id(4L)
            .nickname("4")
            .password("4")
            .build();

    final CustomerRqDto CUSTOMER_DTO_INCORRECT_EMAIl_2 = CustomerRqDto.builder()
            .id(4L)
            .nickname("4")
            .email("")
            .password("4")
            .build();


    final CustomerRqDto CUSTOMER_DTO_INCORRECT_PASSWORD_1 = CustomerRqDto.builder()
            .id(5L)
            .nickname("5")
            .email("5")
            .build();

    final CustomerRqDto CUSTOMER_DTO_INCORRECT_PASSWORD_2 = CustomerRqDto.builder()
            .id(5L)
            .nickname("5")
            .email("5")
            .password("")
            .build();
    final CustomerRqDto CUSTOMER_DTO_INCORRECT_NICKNAME_1 = CustomerRqDto.builder()
            .id(6L)
            .email("6")
            .password("6")
            .build();

    final CustomerRqDto CUSTOMER_DTO_INCORRECT_NICKNAME_2 = CustomerRqDto.builder()
            .id(6L)
            .nickname("")
            .email("6")
            .password("6")
            .build();

    final List<CustomerModel> CUSTOMERS = List.of(
            CUSTOMER_CORRECT_1,
            CUSTOMER_CORRECT_2
    );

    @AfterEach
    public void dropDb() {
        customerRepository.deleteAll();
    }

    @Test
    public void getByIdTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();

        CustomerRsDto customerRsDto = customerController.getById(customerId);

        assertCustomers(CUSTOMER_CORRECT_1, customerRsDto);
    }

    @Test
    public void getByIdExceptionTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> customerController.getById(-1)
        );
    }

    @Test
    public void getAllTest() {
        customerRepository.saveAll(CUSTOMERS);

        List<CustomerRsDto> customerRsDtos = customerController.getAll();

        Assertions.assertEquals(customerRsDtos.size(), CUSTOMERS.size());
        for (int i = 0; i < CUSTOMERS.size(); i++) {
            CustomerModel expected = CUSTOMERS.get(i);
            CustomerRsDto actual = customerRsDtos.get(i);
            assertCustomers(expected, actual);
        }
    }

    @Test
    public void createTest() {
        Long customerId = customerController.create(CUSTOMER_DTO);

        CustomerModel customerModel = customerRepository.findById(customerId).get();

        assertCustomers(CUSTOMER_DTO, customerModel);
    }

    @Test
    public void createAlreadyExistNicknameTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();
        CustomerRqDto customerRqDto = CustomerRqDto.builder()
                .id(customerId)
                .nickname(CUSTOMER_CORRECT_1.getNickname())
                .email("some email")
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> customerController.create(customerRqDto)
        );
    }

    @Test
    public void createAlreadyExistEmailTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();
        CustomerRqDto customerRqDto = CustomerRqDto.builder()
                .id(customerId)
                .nickname("some nickname")
                .email(CUSTOMER_CORRECT_1.getEmail())
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> customerController.create(customerRqDto)
        );
    }

    @Test
    public void createIncorrectNickname1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.create(CUSTOMER_DTO_INCORRECT_NICKNAME_1)
        );
    }

    @Test
    public void createIncorrectNickname2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.create(CUSTOMER_DTO_INCORRECT_NICKNAME_2)
        );
    }

    @Test
    public void createIncorrectPassword1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.create(CUSTOMER_DTO_INCORRECT_PASSWORD_1)
        );
    }

    @Test
    public void createIncorrectPassword2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.create(CUSTOMER_DTO_INCORRECT_PASSWORD_2)
        );
    }

    @Test
    public void createIncorrectEmail1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.create(CUSTOMER_DTO_INCORRECT_EMAIl_1)
        );
    }

    @Test
    public void createIncorrectEmail2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.create(CUSTOMER_DTO_INCORRECT_EMAIl_2)
        );
    }

    @Test
    public void updateTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();
        CustomerRqDto customerRqDto = CustomerRqDto.builder()
                .id(customerId)
                .nickname("new nickname")
                .email("new email")
                .password("new password")
                .build();

        customerController.update(customerRqDto);

        CustomerModel customerModel = customerRepository.findById(customerId).get();
        assertCustomers(customerRqDto, customerModel);
    }

    @Test
    public void updateNotFoundTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> customerController.update(CUSTOMER_DTO)
        );
    }

    @Test
    public void updateIncorrectName1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.update(CUSTOMER_DTO_INCORRECT_NICKNAME_1)
        );
    }

    @Test
    public void updateIncorrectName2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.update(CUSTOMER_DTO_INCORRECT_NICKNAME_2)
        );
    }

    @Test
    public void updateIncorrectPassword1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.update(CUSTOMER_DTO_INCORRECT_PASSWORD_1)
        );
    }

    @Test
    public void updateIncorrectPassword2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.update(CUSTOMER_DTO_INCORRECT_PASSWORD_2)
        );
    }

    @Test
    public void updateIncorrectEmail1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.update(CUSTOMER_DTO_INCORRECT_EMAIl_1)
        );
    }

    @Test
    public void updateIncorrectEmail2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> customerController.update(CUSTOMER_DTO_INCORRECT_EMAIl_2)
        );
    }

    @Test
    public void updateAlreadyExistNicknameTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();
        CustomerRqDto customerRqDto = CustomerRqDto.builder()
                .id(customerId)
                .nickname(CUSTOMER_CORRECT_1.getNickname())
                .email("some email")
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> customerController.update(customerRqDto)
        );
    }

    @Test
    public void updateAlreadyExistEmailTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();
        CustomerRqDto customerRqDto = CustomerRqDto.builder()
                .id(customerId)
                .nickname("some nickname")
                .email(CUSTOMER_CORRECT_1.getEmail())
                .password("some password")
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> customerController.update(customerRqDto)
        );
    }

    @Test
    public void deleteTest() {
        Long customerId = customerRepository.save(CUSTOMER_CORRECT_1).getId();

        customerController.delete(customerId);

        Optional<CustomerModel> customerModel = customerRepository.findById(customerId);
        Assertions.assertTrue(customerModel.isEmpty());
    }

    @Test
    public void deleteNotFoundTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> customerController.delete(-1)
        );
    }

    private void assertCustomers(CustomerModel expected, CustomerRsDto actual) {
        Assertions.assertEquals(expected.getNickname(), actual.getNickname());
        Assertions.assertEquals(expected.getEmail(), actual.getEmail());
    }

    private void assertCustomers(CustomerRqDto expected, CustomerModel actual) {
        Assertions.assertEquals(expected.getNickname(), actual.getNickname());
        Assertions.assertEquals(expected.getEmail(), actual.getEmail());
    }
}
