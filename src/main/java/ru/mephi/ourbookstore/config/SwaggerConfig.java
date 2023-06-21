package ru.mephi.ourbookstore.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {
    @Value("${swagger-api.version}")
    private String swaggerApiVersion;
    private  static final String SWAGGER_TITLE = "Book_store";
    private  static final String SWAGGER_DESC = "This are some implementation book store";

    @Bean
    public OpenAPI apiInfo() {
        return new OpenAPI().info(new Info()
                .title(SWAGGER_TITLE)
                .description(SWAGGER_DESC)
                .version(swaggerApiVersion)
        );
    }
}
