package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.AppointmentStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentStatusRepository extends JpaRepository<AppointmentStatus,Integer> {
}
