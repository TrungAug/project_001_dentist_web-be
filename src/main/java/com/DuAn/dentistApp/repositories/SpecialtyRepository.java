package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Specialty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpecialtyRepository extends JpaRepository<Specialty,Integer> {
}
