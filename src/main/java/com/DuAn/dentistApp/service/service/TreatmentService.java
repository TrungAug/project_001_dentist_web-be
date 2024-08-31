package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Treatment;
import com.DuAn.dentistApp.model.request.TreatmentRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface TreatmentService {
    Treatment findByTreatmentId(int treatmentId);

    List<Treatment> findAllTreatment();

    List<Treatment> findAllTreatmentExceptDeleted();

    Treatment saveTreatment(TreatmentRequest treatmentRequest);

    Treatment updateTreatment(int treatmentId, TreatmentRequest treatmentRequest);

    MessageResponse delete(int treatmentId);

    MessageResponse softDeleteTreatment(int treatmentId);

    List<Object> findTreatmentByDentalIssues(List<Integer> ids);

    List<Object> findServiceByTreatment(List<Integer> ids);
}
