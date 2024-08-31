package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepositoty extends JpaRepository<Role,Integer> {
    Optional<Role> findByRoleName(String name);
}
