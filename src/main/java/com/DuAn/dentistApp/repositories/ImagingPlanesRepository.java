package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.ImagingPlanes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImagingPlanesRepository extends JpaRepository<ImagingPlanes,Integer> {
}
