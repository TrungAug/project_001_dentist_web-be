package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.MedicinesDosageAmount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicinesDosageAmountRepository extends JpaRepository<MedicinesDosageAmount,Integer> {
}
