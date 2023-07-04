package ru.mephi.ourbookstore.service.customer;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.CustomerModel;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;
import ru.mephi.ourbookstore.mapper.customer.CustomerModelMapper;
import ru.mephi.ourbookstore.repository.customer.CustomerRepository;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;

import static ru.mephi.ourbookstore.domain.Entities.CUSTOMER;


/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CustomerService {

    final CustomerRepository customerRepository;
    final CustomerModelMapper customerModelMapper;

    public Customer getById(long customerId) {
        CustomerModel customerModel = customerRepository.findById(customerId)
                .orElseThrow(() -> new NotFoundException(CUSTOMER, "id", customerId));
        return customerModelMapper.modelToObject(customerModel);
    }

    public List<Customer> getAll() {
        return customerRepository.findAll().stream()
                .map(customerModelMapper::modelToObject)
                .toList();
    }

    @Transactional
    public Long create(Customer customer) {
        validate(customer);
        String nickname = customer.getNickname();
        if (customerRepository.findByNickname(nickname).isPresent()) {
            throw new AlreadyExistException(CUSTOMER, "nickname", nickname);
        }
        String email = customer.getEmail();
        if (customerRepository.findByEmail(email).isPresent()) {
            throw new AlreadyExistException(CUSTOMER, "email", email);
        }
        CustomerModel customerModel = customerModelMapper.objectToModel(customer);
        return customerRepository.save(customerModel).getId();
    }

    @Transactional
    public void update(Customer customer) {
        validate(customer);
        Long customerId = customer.getId();
        customerRepository.findById(customerId)
                .orElseThrow(() -> new NotFoundException(CUSTOMER, "id", customerId));
        String nickname = customer.getNickname();
        if (customerRepository.findByNickname(nickname).isPresent()) {
            throw new AlreadyExistException(CUSTOMER, "nickname", nickname);
        }
        String email = customer.getEmail();
        if (customerRepository.findByEmail(email).isPresent()) {
            throw new AlreadyExistException(CUSTOMER, "email", email);
        }
        CustomerModel customerModel = customerModelMapper.objectToModel(customer);
        customerRepository.save(customerModel);
    }

    @Transactional
    public void delete(Long customerId) {
        customerRepository.findById(customerId)
                .orElseThrow(() -> new NotFoundException(CUSTOMER, "id", customerId));
        customerRepository.deleteById(customerId);
    }

    private void validate(Customer customer) {
        String email = customer.getEmail();
        if (email == null || email.isBlank()) {
            throw new ValidationException(CUSTOMER, "email", email);
        }
        String nickname = customer.getNickname();
        if (nickname == null || nickname.isBlank()) {
            throw new ValidationException(CUSTOMER, "nickname", nickname);
        }
        String password = customer.getPassword();
        if (password == null || password.isBlank()) {
            throw new ValidationException(CUSTOMER, "password", password);
        }
    }
}
