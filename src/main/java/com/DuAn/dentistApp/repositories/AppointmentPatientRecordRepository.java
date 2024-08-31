package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.AppointmentPatientRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentPatientRecordRepository extends JpaRepository<AppointmentPatientRecord,Integer> {
}
