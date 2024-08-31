package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.MedicineCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicinesCategoryRepository extends JpaRepository<MedicineCategory,Integer> {

}
