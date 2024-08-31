package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.MedicalHistoryDetail;
import com.DuAn.dentistApp.model.request.MedicalHistoryDetailRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface MedicalHistoryDetailService {
    MedicalHistoryDetail findByMedicalHistoryDetailId(int medicalHistoryDetailId);

    List<MedicalHistoryDetail> findAllMedicalHistoryDetail();

    List<MedicalHistoryDetail> findAllMedicalHistoryDetailExceptDeleted();

    MedicalHistoryDetail saveMedicalHistoryDetail(MedicalHistoryDetailRequest medicalhistoryDetailRequest);

    MedicalHistoryDetail updateMedicalHistoryDetail(int medicalHistoryDetailId, MedicalHistoryDetailRequest medicalHistoryDetailRequest);

    MessageResponse delete(int medicalHistoryDetailId);

    MessageResponse softDeleteMedicalHistoryDetail(int medicalHistoryDetailId);
}
