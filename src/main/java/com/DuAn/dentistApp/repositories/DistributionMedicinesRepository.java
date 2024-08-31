package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.DistributionMedicines;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DistributionMedicinesRepository extends JpaRepository<DistributionMedicines,Integer> {
}
