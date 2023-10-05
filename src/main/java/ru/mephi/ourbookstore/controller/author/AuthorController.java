package ru.mephi.ourbookstore.controller.author;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.domain.dto.author.AuthorCreateDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;
import ru.mephi.ourbookstore.mapper.author.AuthorDtoMapper;
import ru.mephi.ourbookstore.service.author.AuthorService;

import java.util.List;

@RestController
@RequestMapping("/authors")
@RequiredArgsConstructor
@SecurityRequirement(name = "bearerAuth")
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

    @PostMapping
    public Long create(@RequestBody AuthorCreateDto authorRqDto) {
        Author author = authorDtoMapper.dtoToObject(authorRqDto);
        return authorService.create(author);
    }

    @PutMapping
    public void update(@RequestBody AuthorUpdateDto authorRqDto) {
        Author author = authorDtoMapper.dtoToObject(authorRqDto);
        authorService.update(author);
    }

    @DeleteMapping("/{authorId}")
    public void delete(@PathVariable long authorId) {
        authorService.delete(authorId);
    }
}