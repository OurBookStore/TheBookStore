package ru.mephi.ourbookstore.util;

import java.time.LocalDate;
import java.time.LocalDateTime;

import ru.mephi.ourbookstore.domain.*;
import ru.mephi.ourbookstore.domain.dto.book.BookCreateDto;
import ru.mephi.ourbookstore.domain.dto.book.BookUpdateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderCreateDto;
import ru.mephi.ourbookstore.domain.dto.order.OrderUpdateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionCreateDto;
import ru.mephi.ourbookstore.domain.dto.orderPosition.OrderPositionUpdateDto;

public abstract class TestHelper {

    public static class AppUserEntity {

        public static AppUserModel getTetsAppUserModel(Long version) {
            return AppUserModel.builder()
                    .id(version)
                    .nickname("nickname" + version.toString())
                    .email("email" + version + "@test.ru")
                    .password("password" + version)
                    .build();
        }
    }

    public static class OrderEntity {

        public static OrderModel getOrderModel(Long version) {
            return OrderModel.builder()
                    .id(version)
                    .address("address" + version)
                    .totalPrice(0)
                    .build();
        }

        public static OrderStatusHistoryModel getTestOSH(Long version) {
            return OrderStatusHistoryModel.builder()
                    .id(version)
                    .actualFlag(true)
                    .actualFrom(LocalDateTime.now())
                    .build();
        }

        public static OrderCreateDto getOrderCreateDto(Long version) {
            return OrderCreateDto.builder()
                    .address("address" + version)
                    .appUserId(version)
                    .build();
        }

        public static OrderUpdateDto getOrderUpdateDto(Long version) {
            return OrderUpdateDto.builder()
                    .id(version)
                    .address("address" + version)
                    .build();
        }
    }

    public static class OrderPositionEntity {
        public static OrderPositionCreateDto getOrderPositionCreateDto(Long version) {
            return OrderPositionCreateDto.builder()
                    .bookId(version)
                    .count(version.intValue())
                    .build();
        }

        public static OrderPositionUpdateDto getOrderPositionUpdateDto(Long version) {
            return OrderPositionUpdateDto.builder()
                    .id(version)
                    .count(version.intValue())
                    .build();
        }

        public static OrderPositionModel getOrderPositionModel(Long version) {
            return OrderPositionModel.builder()
                    .id(version)
                    .price(0)
                    .count(version.intValue())
                    .build();
        }
    }

    public static class BookEntity {
        public static BookModel getBookModelDto(Long version) {
            return BookModel.builder()
                    .id(version)
                    .count(version.intValue())
                    .name("name" + version)
                    .price(version * 100)
                    .build();
        }

        public static BookModel getBookModel1() {
            return BookModel.builder()
                    .name("1")
                    .price(1)
                    .count(1)
                    .image("1")
                    .build();
        }

        public static BookModel getBookModel2() {
            return BookModel.builder()
                    .name("2")
                    .price(2)
                    .count(2)
                    .image("2")
                    .build();
        }

        public static BookUpdateDto getBookUpdateDto() {
            return BookUpdateDto.builder()
                    .id(1L)
                    .name("11")
                    .price(11)
                    .count(11)
                    .build();
        }

        public static BookCreateDto getBookCreateDto() {
            return BookCreateDto.builder()
                    .name("3")
                    .price(3)
                    .count(3)
                    .build();
        }

        public static BookUpdateDto getBookUpdateDtoUnknown() {
            return BookUpdateDto.builder()
                    .id(3L)
                    .name("3")
                    .price(3)
                    .count(3)
                    .build();
        }

        public static BookCreateDto getBookCreateDtoIncorrectPrice() {
            return BookCreateDto.builder()
                    .name("4")
                    .price(-4)
                    .count(4)
                    .build();
        }

        public static BookUpdateDto getBookUpdateDtoIncorrectPrice() {
            return BookUpdateDto.builder()
                    .id(4L)
                    .name("4")
                    .price(-4)
                    .count(4)
                    .build();
        }

        public static BookCreateDto getBookCreateDtoIncorrectCount() {
            return BookCreateDto.builder()
                    .name("5")
                    .price(5)
                    .count(-5)
                    .build();
        }

        public static BookUpdateDto getBookUpdateDtoIncorrectCount() {
            return BookUpdateDto.builder()
                    .id(5L)
                    .name("5")
                    .price(5)
                    .count(-5)
                    .build();
        }

        public static BookCreateDto getBookCreateDtoIncorrectName1() {
            return BookCreateDto.builder()
                    .price(6)
                    .count(6)
                    .build();
        }

        public static BookUpdateDto getBookUpdateDtoIncorrectName1() {
            return BookUpdateDto.builder()
                    .id(6L)
                    .price(6)
                    .count(6)
                    .build();
        }

        public static BookCreateDto getBookCreateDtoIncorrectName2() {
            return BookCreateDto.builder()
                    .name("")
                    .price(6)
                    .count(6)
                    .build();
        }

        public static BookUpdateDto getBookUpdateDtoIncorrectName2() {
            return BookUpdateDto.builder()
                    .id(6L)
                    .name("")
                    .price(6)
                    .count(6)
                    .build();
        }
    }

    public static class AuthorEntity {
        public static AuthorModel getAuthorModel1() {
            return AuthorModel.builder()
                    .fullName("1")
                    .dateOfBirth(LocalDate.parse("2023-01-01"))
                    .country("1")
                    .build();
        }

        public static AuthorModel getAuthorModel2() {
            return AuthorModel.builder()
                    .fullName("2")
                    .dateOfBirth(LocalDate.parse("2023-01-01"))
                    .country("2")
                    .build();
        }
    }
}
