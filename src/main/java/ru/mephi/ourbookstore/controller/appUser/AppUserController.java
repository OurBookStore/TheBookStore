package ru.mephi.ourbookstore.controller.appUser;

import java.util.List;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.appUser.*;
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

    @PatchMapping("/address")
    @SecurityRequirement(name = "bearerAuth")
    @PreAuthorize("hasRole('ADMIN') or @appUserAuthService.checkPermission('APP_USER',#appUserPatchDto.id)")
    public void updateAddress(@RequestBody AppUserPatchDto appUserPatchDto) {
        appUserService.updateAddress(appUserPatchDto);
    }

    @GetMapping("/address")
    @SecurityRequirement(name = "bearerAuth")
    public AppUserPatchDto getAddress(@AuthenticationPrincipal Jwt jwt) {
        return  appUserService.getAddress(jwt);
    }

    @DeleteMapping("/address")
    @SecurityRequirement(name = "bearerAuth")
    public void removeAddress(@AuthenticationPrincipal Jwt jwt) {
        appUserService.removeAddress(jwt);
    }

    @SecurityRequirement(name = "bearerAuth")
    @DeleteMapping("/{appUserId}")
    @PreAuthorize("hasRole('ADMIN')")
    public void delete(@PathVariable long appUserId) {
        appUserService.delete(appUserId);
    }
}
