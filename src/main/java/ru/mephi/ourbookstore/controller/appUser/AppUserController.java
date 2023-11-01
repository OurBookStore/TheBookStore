package ru.mephi.ourbookstore.controller.appUser;

import java.util.List;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
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

    @SecurityRequirement(name = "bearerAuth")
    @GetMapping("/{appUserId}")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#appUserId)")
    public AppUserDto getById(@PathVariable long appUserId) {
        return appUserDtoMapper.objectToDto(appUserService.getById(appUserId));
    }

    @SecurityRequirement(name = "bearerAuth")
    @GetMapping("/userInfo")
    public AppUserDto getUserInfo(@AuthenticationPrincipal Jwt jwt) {
        return appUserDtoMapper.objectToDto(appUserService.getUserInfo(jwt));
    }

    @SecurityRequirement(name = "bearerAuth")
    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
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
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#appUserRqDto.id)")
    public void update(@RequestBody AppUserUpdateDto appUserRqDto) {
        AppUser appUser = appUserDtoMapper.dtoToObject(appUserRqDto);
        appUserService.update(appUser);
    }

    @SecurityRequirement(name = "bearerAuth")
    @DeleteMapping("/{appUserId}")
    @PreAuthorize("hasRole('ADMIN')")
    public void delete(@PathVariable long appUserId) {
        appUserService.delete(appUserId);
    }
}
