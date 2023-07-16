package ru.mephi.ourbookstore.controller.customer;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerCreateDto;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerDto;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerUpdateDto;
import ru.mephi.ourbookstore.mapper.customer.CustomerDtoMapper;
import ru.mephi.ourbookstore.service.customer.CustomerService;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@RestController
@RequestMapping("/customers")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CustomerController {

    final CustomerService customerService;
    final CustomerDtoMapper customerDtoMapper;

    @GetMapping("/{customerId}")
    public CustomerDto getById(@PathVariable long customerId) {
        return customerDtoMapper.objectToDto(customerService.getById(customerId));
    }

    @GetMapping
    public List<CustomerDto> getAll() {
        return customerService.getAll().stream()
                .map(customerDtoMapper::objectToDto)
                .toList();
    }

    @PostMapping
    public Long create(@RequestBody CustomerCreateDto customerRqDto) {
        Customer customer = customerDtoMapper.dtoToObject(customerRqDto);
        return customerService.create(customer);
    }

    @PutMapping
    public void update(@RequestBody CustomerUpdateDto customerRqDto) {
        Customer customer = customerDtoMapper.dtoToObject(customerRqDto);
        customerService.update(customer);
    }

    @DeleteMapping("/{customerId}")
    public void delete(@PathVariable long customerId) {
        customerService.delete(customerId);
    }
}
