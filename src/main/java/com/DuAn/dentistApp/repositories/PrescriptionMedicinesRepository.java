package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.PrescriptionMedicines;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrescriptionMedicinesRepository extends JpaRepository<PrescriptionMedicines,Integer> {
}
