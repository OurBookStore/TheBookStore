package ru.mephi.ourbookstore.domain.dto.keyCloak;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Schema(description = "Auth Body")
public class AuthRequest {

    @Schema(example = "admin")
    String username;
    @Schema(example = "admin")
    String password;
}
