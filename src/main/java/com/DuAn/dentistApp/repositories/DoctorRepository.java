package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor,Integer> {
    List<Doctor> findBySpecialtySpecialtyId(int specialtyId);

}
