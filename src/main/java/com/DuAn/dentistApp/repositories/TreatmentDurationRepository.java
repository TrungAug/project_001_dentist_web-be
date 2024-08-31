package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.TreatmentDuration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TreatmentDurationRepository extends JpaRepository<TreatmentDuration,Integer> {
}
