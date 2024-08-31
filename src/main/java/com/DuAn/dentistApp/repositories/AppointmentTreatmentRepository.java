package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.AppointmentTreatment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentTreatmentRepository extends JpaRepository<AppointmentTreatment,Integer> {
}
