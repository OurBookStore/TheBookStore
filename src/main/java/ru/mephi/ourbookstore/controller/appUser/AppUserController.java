package ru.mephi.ourbookstore.controller.appUser;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUser;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserCreateDto;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserDto;
import ru.mephi.ourbookstore.domain.dto.appUser.AppUserUpdateDto;
import ru.mephi.ourbookstore.mapper.appUser.AppUserDtoMapper;
import ru.mephi.ourbookstore.service.appUser.AppUserService;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@RestController
@RequestMapping("/appUsers")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUserController {

    final AppUserService appUserService;
    final AppUserDtoMapper appUserDtoMapper;

    @GetMapping("/{appUserId}")
    public AppUserDto getById(@PathVariable long appUserId) {
        return appUserDtoMapper.objectToDto(appUserService.getById(appUserId));
    }

    @GetMapping
    public List<AppUserDto> getAll() {
        return appUserService.getAll().stream()
                .map(appUserDtoMapper::objectToDto)
                .toList();
    }

    @PostMapping
    public Long create(@RequestBody AppUserCreateDto appUserRqDto) {
        AppUser appUser = appUserDtoMapper.dtoToObject(appUserRqDto);
        return appUserService.create(appUser);
    }

    @PutMapping
    public void update(@RequestBody AppUserUpdateDto appUserRqDto) {
        AppUser appUser = appUserDtoMapper.dtoToObject(appUserRqDto);
        appUserService.update(appUser);
    }

    @DeleteMapping("/{appUserId}")
    public void delete(@PathVariable long appUserId) {
        appUserService.delete(appUserId);
    }
}
