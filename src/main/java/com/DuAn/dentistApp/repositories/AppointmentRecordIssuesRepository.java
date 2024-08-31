package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.AppointmentRecordIssues;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentRecordIssuesRepository extends JpaRepository<AppointmentRecordIssues,Integer> {
}
