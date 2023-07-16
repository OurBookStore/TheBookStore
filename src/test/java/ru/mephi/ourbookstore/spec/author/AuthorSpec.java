package ru.mephi.ourbookstore.spec.author;

import ru.mephi.ourbookstore.domain.dto.author.AuthorCreateDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;
import ru.mephi.ourbookstore.spec.BaseSpec;

import java.util.List;

import static io.restassured.RestAssured.given;

public class AuthorSpec {
    public static long createAuthorSuccessful(AuthorCreateDto authorCreateDto) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorCreateDto)
                .post("/author")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().as(Long.TYPE);
    }

    public static void createAuthorInvalid(AuthorCreateDto authorCreateDto) {
        given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorCreateDto)
                .post("/author")
                .then()
                .spec(BaseSpec.getResponseSpec(400))
                .extract().body().asPrettyString();
    }

    public static void updateAuthor(AuthorUpdateDto authorUpdateDto) {
        given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorUpdateDto)
                .put("/author")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().asPrettyString();
    }

    public static void updateAuthorInvalid(AuthorUpdateDto authorUpdateDto) {
        given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorUpdateDto)
                .put("/author")
                .then()
                .spec(BaseSpec.getResponseSpec(400))
                .extract().body().asPrettyString();
    }

    public static void deleteNotExistingAuthor(Long id) {
        given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .delete("/author/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(404))
                .extract().body().asPrettyString();
    }

    public static void deleteAuthor(Long id) {
        given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .delete("/author/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().asPrettyString();
    }

    public static AuthorDto getAuthor(Long id) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .get("/author/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().as(AuthorDto.class);
    }

    public static void getNotExistingAuthor(Long id) {
        given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .get("/author/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(404))
                .extract().body().asPrettyString();
    }

    public static List<AuthorDto> getAll() {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .get("/author")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().jsonPath().getList(".", AuthorDto.class);
    }
}