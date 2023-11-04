package ru.mephi.ourbookstore.config.swagger;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {
    private final String securitySchemeName = "bearerAuth";
    private static final String SWAGGER_TITLE = "Book store";
    private static final String SWAGGER_DESC = "This are some implementation book store";
    private static final String SWAGGER_VERSION = "1.0";

    @Bean
    public OpenAPI apiInfo() {
        return new OpenAPI()
                .info(
                        new Info()
                                .title(SWAGGER_TITLE)
                                .description(SWAGGER_DESC)
                                .version(SWAGGER_VERSION)
                )
                .components(
                        new Components()
                                .addSecuritySchemes(securitySchemeName, new SecurityScheme()
                                        .name(securitySchemeName)
                                        .type(SecurityScheme.Type.HTTP)
                                        .scheme("bearer")
                                        .bearerFormat("JWT"))
                );
    }

}
