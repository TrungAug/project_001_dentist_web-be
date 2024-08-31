package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.FrequencyMedicines;
import com.DuAn.dentistApp.model.request.FrequencyMedicineRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface FrequencyMedicinesService {
    FrequencyMedicines findByFrequencyMedicineId(int frequencyMedicineId) ;

    List<FrequencyMedicines> findAllFrequencyMedicines() ;

    List<FrequencyMedicines> findAllFrequencyMedicinesExceptDeleted() ;

    FrequencyMedicines saveFrequencyMedicine(FrequencyMedicineRequest frequencyMedicineRequest) ;

    FrequencyMedicines updateFrequencyMedicine(int frequencyMedicineId, FrequencyMedicineRequest frequencyMedicineRequest) ;

    MessageResponse deleteFrequencyMedicine(int frequencyMedicineId) ;

    MessageResponse softDeleteFrequencyMedicine(int frequencyMedicineId) ;
}
