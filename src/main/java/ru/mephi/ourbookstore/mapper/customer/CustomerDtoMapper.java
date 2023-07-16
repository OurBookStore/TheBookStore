package ru.mephi.ourbookstore.mapper.customer;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerCreateDto;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerDto;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerUpdateDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface CustomerDtoMapper {

    Customer dtoToObject(CustomerCreateDto model);

    Customer dtoToObject(CustomerUpdateDto model);

    CustomerDto objectToDto(Customer book);
}
