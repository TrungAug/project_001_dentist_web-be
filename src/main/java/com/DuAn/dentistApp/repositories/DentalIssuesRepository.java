package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.DentalIssues;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DentalIssuesRepository extends JpaRepository<DentalIssues,Integer> {
}
