package ru.mephi.ourbookstore.service.authorizationService;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.mephi.ourbookstore.domain.AppUserModel;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.util.authRules.Resource;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AppUserAuthService {

    final AppUserRepository appUserRepository;

    @Transactional(readOnly = true)
    public boolean checkPermission(Resource resource, long resourceId) {
        Jwt jwt = (Jwt) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        Optional<AppUserModel> appUserReqOpt = appUserRepository.findAppUserModelByKeycloakId(jwt.getSubject());
        if (appUserReqOpt.isEmpty())
            return false;
        AppUserModel appUserReq = appUserReqOpt.get();
        return switch (resource){
            case ORDER -> appUserReq
                    .getOrders()
                    .stream()
                    .anyMatch(orderModel -> orderModel.getId().equals(resourceId));
            case APP_USER -> appUserReq
                    .getId().equals(resourceId);
            case ORDER_POSITION -> {
                boolean ordersAnyMatch = appUserReq.getOrders().stream()
                        .flatMap(orderModel -> orderModel.getOrderPositions().stream())
                        .anyMatch(orderPositionModel -> orderPositionModel.getId().equals(resourceId));
                boolean cartAnyMatch = appUserReq.getCart().getOrderPositions().stream()
                        .anyMatch(orderPositionModel -> orderPositionModel.getId().equals(resourceId));
                yield ordersAnyMatch || cartAnyMatch;
            }

            case CART -> appUserReq.getCart().getId().equals(resourceId);
        };
    }
}
