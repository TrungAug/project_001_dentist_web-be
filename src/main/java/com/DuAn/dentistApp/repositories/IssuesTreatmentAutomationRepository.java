package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.IssuesTreatmentAutomation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IssuesTreatmentAutomationRepository extends JpaRepository<IssuesTreatmentAutomation,Integer> {
}
