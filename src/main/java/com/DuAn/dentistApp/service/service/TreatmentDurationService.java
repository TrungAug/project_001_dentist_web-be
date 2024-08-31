package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.TreatmentDuration;
import com.DuAn.dentistApp.model.request.TreatmentDurationRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface TreatmentDurationService {
    TreatmentDuration findByTreatmentDurationId(int durationId) ;

    List<TreatmentDuration> findAllTreatmentDurations() ;

    List<TreatmentDuration> findAllTreatmentDurationsExceptDeleted() ;

    TreatmentDuration saveTreatmentDuration(TreatmentDurationRequest durationRequest) ;

    TreatmentDuration updateTreatmentDuration(int durationId, TreatmentDurationRequest durationRequest) ;

    MessageResponse deleteTreatmentDuration(int durationId) ;

    MessageResponse softDeleteTreatmentDuration(int durationId) ;
}
