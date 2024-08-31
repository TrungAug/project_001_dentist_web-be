package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.DentalSupplies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DentalSuppliesRepository extends JpaRepository<DentalSupplies,Integer> {
}
