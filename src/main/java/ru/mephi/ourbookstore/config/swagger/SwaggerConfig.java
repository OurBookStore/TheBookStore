package ru.mephi.ourbookstore.config.swagger;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    private static final String SWAGGER_TITLE = "Book store";
    private static final String SWAGGER_DESC = "This are some implementation book store";
    private static final String SWAGGER_VERSION = "1.0";

    @Bean
    public OpenAPI apiInfo() {
        return new OpenAPI().info(new Info()
                .title(SWAGGER_TITLE)
                .description(SWAGGER_DESC)
                .version(SWAGGER_VERSION));
    }
}
