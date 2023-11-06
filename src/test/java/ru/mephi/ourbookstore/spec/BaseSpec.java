package ru.mephi.ourbookstore.spec;

import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.filter.log.LogDetail;
import io.restassured.parsing.Parser;
import io.restassured.specification.ResponseSpecification;
import org.hamcrest.Matchers;

public class BaseSpec {

    public static ResponseSpecification getResponseSpec(int httpStatus) {
        return new ResponseSpecBuilder()
                .expectStatusCode(httpStatus)
                .setDefaultParser(Parser.JSON)
                .log(LogDetail.BODY)
                .build();
    }

    public static ResponseSpecification getResponseSpec(int httpStatus,
                                                        String expectedMessage
    ) {
        return new ResponseSpecBuilder()
                .expectStatusCode(httpStatus)
                .setDefaultParser(Parser.JSON)
                .expectBody("message", Matchers.equalTo(expectedMessage))
                .log(LogDetail.BODY)
                .build();
    }
}
