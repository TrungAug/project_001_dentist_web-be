package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.ServiceTreatment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceTreatmentRepository extends JpaRepository<ServiceTreatment,Integer> {
}
