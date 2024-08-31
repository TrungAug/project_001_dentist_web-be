package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.ServiceType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceTypeRepository extends JpaRepository<ServiceType,Integer> {
}
