package ru.mephi.ourbookstore.repository.appUser;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.AppUserModel;

import java.util.Optional;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Repository
public interface AppUserRepository extends JpaRepository<AppUserModel, Long> {

    Optional<AppUserModel> findByNickname(String nickname);

    Optional<AppUserModel> findAppUserModelByKeycloakId(String keycloakId);

    Optional<AppUserModel> findByEmail(String email);
}
