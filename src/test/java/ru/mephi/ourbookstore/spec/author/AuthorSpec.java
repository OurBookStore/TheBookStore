package ru.mephi.ourbookstore.spec.author;

import ru.mephi.ourbookstore.domain.dto.author.AuthorCreateDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;
import ru.mephi.ourbookstore.spec.BaseSpec;

import java.util.List;

import static io.restassured.RestAssured.given;

public class AuthorSpec extends BaseSpec{
    public static long createAuthorSuccessful(AuthorCreateDto authorCreateDto) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorCreateDto)
                .post("/authors")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().as(Long.TYPE);
    }

    public static String createAuthorInvalid(AuthorCreateDto authorCreateDto) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorCreateDto)
                .post("/authors")
                .then()
                .spec(BaseSpec.getResponseSpec(400))
                .extract().body().asPrettyString();
    }

    public static String updateAuthor(AuthorUpdateDto authorUpdateDto) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorUpdateDto)
                .put("/authors")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().asPrettyString();
    }

    public static String updateAuthorInvalid(AuthorUpdateDto authorUpdateDto) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .body(authorUpdateDto)
                .put("/authors")
                .then()
                .spec(BaseSpec.getResponseSpec(400))
                .extract().body().asPrettyString();
    }

    public static String deleteNotExistingAuthor(Long id) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .delete("/authors/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(404))
                .extract().body().asPrettyString();
    }

    public static String deleteAuthor(Long id) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .delete("/authors/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().asPrettyString();
    }

    public static AuthorDto getAuthor(Long id) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .get("/authors/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().as(AuthorDto.class);
    }

    public static String  getNotExistingAuthor(Long id) {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .pathParam("authorId", id)
                .get("/authors/{authorId}")
                .then()
                .spec(BaseSpec.getResponseSpec(404))
                .extract().body().asPrettyString();
    }

    public static List<AuthorDto> getAll() {
        return given()
                .spec(BaseSpec.getRequestSpec())
                .when()
                .get("/authors")
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().body().jsonPath().getList(".", AuthorDto.class);
    }
}