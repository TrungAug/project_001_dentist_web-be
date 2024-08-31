package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Abnormality;
import com.DuAn.dentistApp.model.request.AbnormalityRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AbnormalityService {

    Abnormality findByAbnormalityId(int abnormalityId);

    List<Abnormality> findAll();

    List<Abnormality> findAllExceptDeleted();

    Abnormality saveAbnormality(AbnormalityRequest abnormalityRequest);

    Abnormality updateAbnormality(int abnormalityId, AbnormalityRequest abnormalityRequest);

    MessageResponse delete(int abnormalityId);

    MessageResponse softDeleteAbnormality(int abnormalityId);
}
