package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DistributionMedicines;
import com.DuAn.dentistApp.model.request.DistributionMedicinesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DistributionMedicinesService {
    DistributionMedicines findByDistributionMedicinesId(int distributionMedicineId) ;

    List<DistributionMedicines> findAllDistributionMedicines() ;

    List<DistributionMedicines> findAllDistributionMedicinesExceptDeleted() ;

    DistributionMedicines saveDistributionMedicines(DistributionMedicinesRequest distributionMedicineRequest) ;

    DistributionMedicines updateDistributionMedicines(int distributionMedicineId, DistributionMedicinesRequest distributionMedicineRequest) ;

    MessageResponse deleteDistributionMedicines(int distributionMedicineId) ;

    MessageResponse softDeleteDistributionMedicines(int distributionMedicineId) ;
}
