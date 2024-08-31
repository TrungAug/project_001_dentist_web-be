package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.MedicinesDosageUnit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicinesDosageUnitRepository extends JpaRepository<MedicinesDosageUnit,Integer> {
}
