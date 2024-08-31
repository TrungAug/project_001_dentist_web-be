package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Medicines;
import com.DuAn.dentistApp.model.request.MedicineRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface MedicineService {
    Medicines findByMedicineId(int medicineId) ;

    List<Medicines> findAllMedicines() ;

    List<Medicines> findAllMedicinesExceptDeleted() ;

    Medicines saveMedicine(MedicineRequest medicineRequest) ;

    Medicines updateMedicine(int medicineId, MedicineRequest medicineRequest) ;

    MessageResponse deleteMedicine(int medicineId) ;

    MessageResponse softDeleteMedicine(int medicineId) ;

}

