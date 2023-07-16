package ru.mephi.ourbookstore.domain.dto.customer;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CustomerDto {

    Long id;
    String nickname;
    String email;
}
