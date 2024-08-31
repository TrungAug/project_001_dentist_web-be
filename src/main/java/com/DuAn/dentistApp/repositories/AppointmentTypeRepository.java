package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.AppointmentType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentTypeRepository extends JpaRepository<AppointmentType,Integer> {
}
