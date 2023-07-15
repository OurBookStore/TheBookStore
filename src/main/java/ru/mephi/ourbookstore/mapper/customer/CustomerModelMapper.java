package ru.mephi.ourbookstore.mapper.customer;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.CustomerModel;
import ru.mephi.ourbookstore.domain.dto.customer.Customer;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface CustomerModelMapper {

    Customer modelToObject(CustomerModel model);

    CustomerModel objectToModel(Customer customer);
}
