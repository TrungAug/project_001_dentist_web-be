package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.MedicalHistory;
import com.DuAn.dentistApp.model.request.MedicalHistoryRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface MedicalHistoryService {
    MedicalHistory findByMedicalHistoryId(int medicalHistoryId);

    List<MedicalHistory> findAllMedicalHistory();

    List<MedicalHistory> findAllMedicalHistoryExceptDeleted();

    MedicalHistory saveMedicalHistory(MedicalHistoryRequest medicalhistoryRequest);

    MedicalHistory updateMedicalHistory(int medicalHistoryId, MedicalHistoryRequest medicalHistoryRequest);

    MessageResponse delete(int medicalHistoryId);

    MessageResponse softDeleteMedicalHistory(int medicalHistoryId);

    List<MedicalHistory> findMedicalHistoryByPatient(Integer patientId);
}
