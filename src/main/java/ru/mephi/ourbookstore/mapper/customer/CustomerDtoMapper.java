package ru.mephi.ourbookstore.mapper.customer;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerRqDto;
import ru.mephi.ourbookstore.domain.dto.customer.CustomerRsDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface CustomerDtoMapper {

    Customer dtoToObject(CustomerRqDto model);

    CustomerRsDto objectToDto(Customer book);
}
