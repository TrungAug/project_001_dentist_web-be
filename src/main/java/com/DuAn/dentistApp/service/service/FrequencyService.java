package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Frequency;
import com.DuAn.dentistApp.model.request.FrequencyRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface FrequencyService {
    Frequency findByFrequencyId(int frequencyId) ;

    List<Frequency> findAllFrequency() ;

    List<Frequency> findAllFrequencyExceptDeleted() ;

    Frequency saveFrequency(FrequencyRequest frequencyRequest) ;

    Frequency updateFrequency(int frequendyId, FrequencyRequest frequencyRequest) ;

    MessageResponse deleteFrequency(int frequencyId) ;

    MessageResponse softDeleteFrequency(int frequencyId) ;

}
