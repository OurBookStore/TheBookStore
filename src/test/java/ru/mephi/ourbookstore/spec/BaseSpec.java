package ru.mephi.ourbookstore.spec;

import io.restassured.builder.RequestSpecBuilder;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.filter.log.LogDetail;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;

public class BaseSpec {
    private final static String URL = "http://localhost:8080/app";

    public static RequestSpecification getRequestSpec() {
        return new RequestSpecBuilder()
                .setBaseUri(URL)
                .setContentType(ContentType.JSON)
                .log(LogDetail.BODY)
                .build();
    }

    public static ResponseSpecification getResponseSpec(int httpStatus) {
        return new ResponseSpecBuilder()
                .expectStatusCode(httpStatus)
                .log(LogDetail.BODY)
                .build();
    }
}
