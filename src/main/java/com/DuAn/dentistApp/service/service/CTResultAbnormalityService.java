package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.CTResultAbnormality;
import com.DuAn.dentistApp.model.request.CTResultAbnormalityRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface CTResultAbnormalityService {
    CTResultAbnormality findByCTResultAbnormalityId(int cTResultAbnormalityId);

    List<CTResultAbnormality> findAllCTResultAbnormality();

    List<CTResultAbnormality> findAllCTResultAbnormalityExceptDeleted();

    CTResultAbnormality saveCTResultAbnormality(CTResultAbnormalityRequest ctResultAbnormalityRequest);

    CTResultAbnormality updateCTResultAbnormality(int cTResultAbnormalityId, CTResultAbnormalityRequest ctResultAbnormalityRequest);

    MessageResponse delete(int cTResultAbnormalityId);

    MessageResponse softDeleteCTResultAbnormality(int cTResultAbnormalityId);

    List<CTResultAbnormality> findCTResultAbnormalityByAppointmentId(Integer appId);
}
