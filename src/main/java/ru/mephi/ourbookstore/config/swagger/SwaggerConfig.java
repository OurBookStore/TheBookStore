package ru.mephi.ourbookstore.config.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.service.ApiInfo;

@Configuration
public class SwaggerConfig {
    private static final String SWAGGER_TITLE = "Book store";
    private static final String SWAGGER_DESC = "This are some implementation book store";

    @Bean
    public ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title(SWAGGER_TITLE)
                .description(SWAGGER_DESC)
                .build();
    }
}
