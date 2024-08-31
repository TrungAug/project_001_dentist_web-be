package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.FrequencyMedicines;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FrequencyMedicineRepository extends JpaRepository<FrequencyMedicines,Integer> {
}
