package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Shift;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShiftRepository extends JpaRepository<Shift,Integer> {
}
