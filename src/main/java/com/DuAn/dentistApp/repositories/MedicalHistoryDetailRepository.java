package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.MedicalHistoryDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicalHistoryDetailRepository extends JpaRepository<MedicalHistoryDetail,Integer> {
}
