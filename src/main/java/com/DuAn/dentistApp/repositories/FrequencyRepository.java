package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Frequency;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FrequencyRepository extends JpaRepository<Frequency,Integer> {
}
