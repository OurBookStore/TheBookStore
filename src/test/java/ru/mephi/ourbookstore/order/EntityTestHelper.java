package ru.mephi.ourbookstore.order;

import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.domain.OrderModel;
import ru.mephi.ourbookstore.domain.OrderPositionModel;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.order.Order;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPosition;

public abstract class EntityTestHelper {

    public static AppUser getTetsAppUser(Long version){
        return AppUser.builder()
                .id(version)
                .nickname("nickname" + version.toString())
                .email("email" + version + "@test.ru")
                .password("password"+ version)
                .build();
    }

    public static Order getTestOrder(Long version){
        return Order.builder()
                .id(version)
                .address("address"+version)
                .totalPrice(0)
                .build();
    }

    public static OrderPosition getTestOrderPosition(Long version){
        return OrderPosition.builder()
                .id(version)
                .price(0)
                .count(version.intValue())
                .build();
    }

    public static AppUserModel getTetsAppUserModel(Long version){
        return AppUserModel.builder()
                .id(version)
                .nickname("nickname" + version.toString())
                .email("email" + version + "@test.ru")
                .password("password"+ version)
                .build();
    }

    public static OrderModel getTestOrderModel(Long version){
        return OrderModel.builder()
                .id(version)
                .address("address"+version)
                .totalPrice(0)
                .build();
    }

    public static OrderModel getTestOrderModelWithAppUserModel(Long version){
        return OrderModel.builder()
                .id(version)
                .appUser(getTetsAppUserModel(version))
                .address("address"+version)
                .totalPrice(0)
                .build();
    }

    public static OrderPositionModel getTestOrderPositionModel(Long version){
        return OrderPositionModel.builder()
                .id(version)
                .price(0)
                .count(version.intValue())
                .build();
    }
    
    public static OrderCreateDto getTestOrderCreateDto(Long version){
        return OrderCreateDto.builder()
                .address("address"+version)
                .appUserId(version)
                .build();
    }
}
