package ru.mephi.ourbookstore.controller.author;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.domain.dto.author.AuthorCreateDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;
import ru.mephi.ourbookstore.mapper.author.AuthorDtoMapper;
import ru.mephi.ourbookstore.service.author.AuthorService;
import ru.mephi.ourbookstore.util.authRules.Resource;

import java.util.List;

@RestController
@RequestMapping("/authors")
@RequiredArgsConstructor
public class AuthorController {

    private final AuthorService authorService;
    private final AuthorDtoMapper authorDtoMapper;
    @GetMapping("/{authorId}")
    public AuthorDto getAuthorById(@PathVariable Long authorId){
        return authorDtoMapper.objectToDto(authorService.getById(authorId));
    }

    @GetMapping
    public List<AuthorDto> getAll() {
        return authorService.getAll().stream()
                .map(authorDtoMapper::objectToDto)
                .toList();
    }

    @SecurityRequirement(name = "bearerAuth")
    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public Long create(@RequestBody AuthorCreateDto authorRqDto) {
        Author author = authorDtoMapper.dtoToObject(authorRqDto);
        return authorService.create(author);
    }

    @SecurityRequirement(name = "bearerAuth")
    @PutMapping
    @PreAuthorize("hasRole('ADMIN')")
    public void update(@RequestBody AuthorUpdateDto authorRqDto) {
        Author author = authorDtoMapper.dtoToObject(authorRqDto);
        authorService.update(author);
    }

    @SecurityRequirement(name = "bearerAuth")
    @DeleteMapping("/{authorId}")
    @PreAuthorize("hasRole('ADMIN')")
    public void delete(@PathVariable long authorId) {
        authorService.delete(authorId);
    }
}