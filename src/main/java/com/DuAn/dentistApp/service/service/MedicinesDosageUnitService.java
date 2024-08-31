package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.MedicinesDosageUnit;
import com.DuAn.dentistApp.model.request.MedicinesDosageUnitRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface MedicinesDosageUnitService {
    MedicinesDosageUnit findMedicinesDosageUnitById(int dosageUnitId) ;

    List<MedicinesDosageUnit> findAllMedicinesDosageUnits() ;

    List<MedicinesDosageUnit> findAllMedicinesDosageUnitsExceptDeleted() ;

    MedicinesDosageUnit saveMedicinesDosageUnit(MedicinesDosageUnitRequest dosageUnitRequest) ;

    MedicinesDosageUnit updateMedicinesDosageUnit(int dosageUnitId, MedicinesDosageUnitRequest dosageUnitRequest) ;

    MessageResponse deleteMedicinesDosageUnit(int dosageUnitId) ;

    MessageResponse softDeleteMedicinesDosageUnit(int dosageUnitId) ;
}
