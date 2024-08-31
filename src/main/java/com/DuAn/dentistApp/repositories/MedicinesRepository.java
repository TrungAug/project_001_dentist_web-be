package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Medicines;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicinesRepository extends JpaRepository<Medicines,Integer> {
}
