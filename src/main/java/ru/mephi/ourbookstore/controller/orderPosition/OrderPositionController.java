package ru.mephi.ourbookstore.controller.orderPosition;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionUpdateDto;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionDtoMapper;
import ru.mephi.ourbookstore.service.orderPosition.OrderPositionService;

@RestController
@RequestMapping("/positions")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@SecurityRequirement(name = "bearerAuth")
public class OrderPositionController {

    final OrderPositionService orderPositionService;
    final OrderPositionDtoMapper orderPositionDtoMapper;

    @PostMapping
    @SecurityRequirement(name = "bearerAuth")
    public Long createOrderPosition(@RequestBody OrderPositionCreateDto orderPositionCreateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(orderPositionCreateDto);
        return orderPositionService.create(orderPosition);
    }

    @PutMapping
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#positionUpdateDto.id)")
    public Long updateOrderPosition(@RequestBody OrderPositionUpdateDto positionUpdateDto) {
        OrderPosition orderPosition = orderPositionDtoMapper.dtoToObject(positionUpdateDto);
        return orderPositionService.update(orderPosition);
    }

    @GetMapping("/{orderPositionId}")
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#orderPositionId)")
    public OrderPositionDto getOrderPosition(@PathVariable Long orderPositionId) {
        return orderPositionDtoMapper.objectToDto(orderPositionService.getById(orderPositionId));
    }

    @DeleteMapping("/{orderPositionId}")
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('ORDER_POSITION',#orderPositionId)")
    public void deleteOrderPosition(@PathVariable Long orderPositionId) {
        orderPositionService.delete(orderPositionId);
    }
}
