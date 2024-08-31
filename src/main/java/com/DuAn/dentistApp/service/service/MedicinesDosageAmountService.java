package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.MedicinesDosageAmount;
import com.DuAn.dentistApp.model.request.MedicinesDosageAmountRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface MedicinesDosageAmountService {
    MedicinesDosageAmount findByMedicinesDosageAmountId(int dosageAmountId) ;

    List<MedicinesDosageAmount> findAllMedicinesDosageAmounts() ;

    List<MedicinesDosageAmount> findAllMedicinesDosageAmountsExceptDeleted() ;

    MedicinesDosageAmount saveMedicinesDosageAmount(MedicinesDosageAmountRequest dosageAmountRequest) ;

    MedicinesDosageAmount updateMedicinesDosageAmount(int dosageAmountId, MedicinesDosageAmountRequest dosageAmountRequest) ;

    MessageResponse deleteMedicinesDosageAmount(int dosageAmountId) ;

    MessageResponse softDeleteMedicinesDosageAmount(int dosageAmountId) ;
}
