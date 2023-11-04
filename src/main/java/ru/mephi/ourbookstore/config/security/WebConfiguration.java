package ru.mephi.ourbookstore.config.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@EnableWebMvc
public class WebConfiguration implements WebMvcConfigurer {

    /**
     * Необходимо для включения CORS запросов для без аутентификациц
     *
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") //or whichever methods you want to allow
                .allowedOrigins("http://localhost:3000") //or www.example.com if you want to be more specific
                .allowedHeaders("Content_Type", "Authorization"); //i also put Authorization since i saw you probably want to do so
    }

}