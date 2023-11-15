package ru.mephi.ourbookstore.image;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.Files;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.core.io.ByteArrayResource;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.spec.BaseSpec;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class ImageTests extends BookStoreTest {

    private static final String IMAGE_PATH = "src/main/resources/image";
    private static final String IMAGE_PATH_PREPARED = "src/test/resources/image/prepared";
    private static final String BASE_URL = "/app/images";

    private static final String IMAGE_ID_1 = "image-7d532810-cf3e-4262-ba5a-acfbae22c151";
    private static final String IMAGE_ID_2 = "image-9fdacf67-7412-4baf-b9d4-94995cc7e05b";
    private static final String IMAGE_ID_3 = "image-17f17fa4-b850-4b3a-bef2-a4cbf6f978f6";
    private static final String IMAGE_ID_UNKNOWN = "image-id";
    private static final Long BOOK_ID_UNKNOWN = 1000L;
    private static Long BOOK_ID_WITH_IMAGE;
    private static Long BOOK_ID_WITHOUT_IMAGE;

    @LocalServerPort
    private int port;

    @BeforeEach
    public void setUpImages() {
        prepareImages();
        prepareBookDb();
    }

    @AfterEach
    public void cleanUpImages() {
        cleanImages();
    }

    @Test
    public void getImageTest() {
        String imageId = IMAGE_ID_1;

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .get(BASE_URL + "/{imageId}", imageId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void saveImageTest() {
        String imageId = IMAGE_ID_2;

        String imageIdSaved = RestAssured.given()
                .port(port)
                .contentType(ContentType.MULTIPART)
                .multiPart("image", getImagePrepared(imageId))
                .when()
                .post(BASE_URL)
                .then()
                .spec(BaseSpec.getResponseSpec(200))
                .extract().asString();

        Assertions.assertTrue(getImage(imageIdSaved).exists());
        new File(IMAGE_PATH + "/" + imageIdSaved + ".png").delete();
    }

    @Test
    public void updateImageTest() {
        String imageId = IMAGE_ID_1;

        RestAssured.given()
                .port(port)
                .contentType(ContentType.MULTIPART)
                .multiPart("image", getImagePrepared(imageId))
                .multiPart("imageId", imageId)
                .when()
                .put(BASE_URL)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void updateImageUnknownTest() {
        String imageId = IMAGE_ID_UNKNOWN;

        RestAssured.given()
                .port(port)
                .contentType(ContentType.MULTIPART)
                .multiPart("image", getImagePrepared(IMAGE_ID_1))
                .multiPart("imageId", imageId)
                .when()
                .put(BASE_URL)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The IMAGE with image name = " + imageId + " not found!"
                ));

        Assertions.assertFalse(getImage(imageId).exists());
    }

    @Test
    public void removeImageTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_WITH_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .delete(BASE_URL + "/{imageId}", imageId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        BookModel bookModel = bookRepository.findById(bookId).get();
        Assertions.assertNull(bookModel.getImage());
        Assertions.assertFalse(getImage(imageId).exists());
    }

    @Test
    public void removeImageUnknownTest() {
        String imageId = IMAGE_ID_UNKNOWN;

        RestAssured.given()
                .port(port)
                .when()
                .delete(BASE_URL + "/{imageId}", imageId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The IMAGE with image name = " + imageId + " not found!"
                ));

        Assertions.assertFalse(getImage(imageId).exists());
    }

    @Test
    public void removeImageFromBookWithImageTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_WITH_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .delete(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        BookModel bookModel = bookRepository.findById(bookId).get();
        Assertions.assertNull(bookModel.getImage());
        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void removeImageFromBookWithoutImageTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_WITHOUT_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .delete(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        BookModel bookModel = bookRepository.findById(bookId).get();
        Assertions.assertNull(bookModel.getImage());
        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void removeImageFromBookNoImageTest() {
        String imageId = IMAGE_ID_UNKNOWN;
        Long bookId = BOOK_ID_WITH_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .delete(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The IMAGE with image name = " + imageId + " not found!"
                ));

        Assertions.assertFalse(getImage(imageId).exists());
    }

    @Test
    public void removeImageFromBookNoBookTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_UNKNOWN;

        RestAssured.given()
                .port(port)
                .when()
                .delete(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The BOOK with id = " + bookId + " not found!"
                ));

        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void addImageToBookWithImageTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_WITH_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .post(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        BookModel bookModel = bookRepository.findById(bookId).get();
        Assertions.assertEquals(imageId, bookModel.getImage());
        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void addImageToBookWithoutImageTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_WITHOUT_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .post(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        BookModel bookModel = bookRepository.findById(bookId).get();
        Assertions.assertEquals(imageId, bookModel.getImage());
        Assertions.assertTrue(getImage(imageId).exists());
    }

    @Test
    public void addImageToBookNoImageTest() {
        String imageId = IMAGE_ID_UNKNOWN;
        Long bookId = BOOK_ID_WITH_IMAGE;

        RestAssured.given()
                .port(port)
                .when()
                .post(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The IMAGE with image name = " + imageId + " not found!"
                ));

        Assertions.assertFalse(getImage(imageId).exists());
    }

    @Test
    public void addImageToBookNoBookTest() {
        String imageId = IMAGE_ID_1;
        Long bookId = BOOK_ID_UNKNOWN;

        RestAssured.given()
                .port(port)
                .when()
                .post(BASE_URL + "/{imageId}/books/{bookId}", imageId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The BOOK with id = " + bookId + " not found!"
                ));

        Assertions.assertTrue(getImage(imageId).exists());
    }

    private File getImagePrepared(String imageId) {
        return new File(IMAGE_PATH_PREPARED + "/" + imageId + ".png");
    }

    private File getImage(String imageId) {
        return new File(IMAGE_PATH + "/" + imageId + ".png");
    }

    private void prepareImages() {
        File file = getImagePrepared(IMAGE_ID_1);
        try (OutputStream os = new FileOutputStream(IMAGE_PATH + "/" + file.getName())) {
            ByteArrayResource image = new ByteArrayResource(Files.readAllBytes(file.toPath()));
            os.write(image.getByteArray());
        } catch (Exception ignore) {
        }
    }

    private void prepareBookDb() {
        BookModel bookWithoutImage = BookModel.builder()
                .name("book-without-image")
                .count(10)
                .price(100)
                .build();
        BookModel bookWithImage = BookModel.builder()
                .name("book-with-image")
                .count(10)
                .price(100)
                .image(IMAGE_ID_1)
                .build();
        BOOK_ID_WITHOUT_IMAGE = bookRepository.save(bookWithoutImage).getId();
        BOOK_ID_WITH_IMAGE = bookRepository.save(bookWithImage).getId();
    }

    private void cleanImages() {
        new File(IMAGE_PATH + "/" + IMAGE_ID_1 + ".png").delete();
        new File(IMAGE_PATH + "/" + IMAGE_ID_2 + ".png").delete();
        new File(IMAGE_PATH + "/" + IMAGE_ID_3 + ".png").delete();
    }
}
