package com.DuAn.dentistApp.repositories;

import com.DuAn.dentistApp.entities.DistributionSupplies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DistributionSuppliesRepository extends JpaRepository<DistributionSupplies,Integer> {
}
