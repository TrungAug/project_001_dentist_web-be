package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Abnormality;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AbnormalityRepository extends JpaRepository<Abnormality,Integer> {
}
