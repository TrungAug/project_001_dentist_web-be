package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.PrescriptionMedicines;
import com.DuAn.dentistApp.model.request.PrescriptionMedicinesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface PrescriptionMedicinesService {
    PrescriptionMedicines findPrescriptionMedicinesById(int prescriptionMedicinesId) ;

    List<PrescriptionMedicines> findAllPrescriptionMedicines() ;

    List<PrescriptionMedicines> findAllPrescriptionMedicinesExceptDeleted() ;

    PrescriptionMedicines savePrescriptionMedicines(PrescriptionMedicinesRequest prescriptionMedicinesRequest) ;

    PrescriptionMedicines updatePrescriptionMedicines(int prescriptionMedicinesId, PrescriptionMedicinesRequest prescriptionMedicinesRequest) ;

    MessageResponse deletePrescriptionMedicines(int prescriptionMedicinesId) ;

    MessageResponse softDeletePrescriptionMedicines(int prescriptionMedicinesId) ;
}

