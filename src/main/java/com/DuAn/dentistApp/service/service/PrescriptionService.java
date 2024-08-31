package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Prescription;
import com.DuAn.dentistApp.model.request.PrescriptionRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.model.response.PrescriptionWithMedicinesResponse;

import java.util.List;

public interface PrescriptionService {
    Prescription findByPrescriptionId(int prescriptionId) ;

    List<Prescription> findAllPrescriptions() ;

    List<Prescription> findAllPrescriptionsExceptDeleted() ;

    Prescription savePrescription(PrescriptionRequest prescriptionRequest) ;

    Prescription updatePrescription(int prescriptionId, PrescriptionRequest prescriptionRequest) ;

    MessageResponse deletePrescription(int prescriptionId) ;

    MessageResponse softDeletePrescription(int prescriptionId) ;

    List<PrescriptionWithMedicinesResponse> findPrescriptionByAppointment(Integer appId);
}
