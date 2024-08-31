package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.CTResultAbnormality;
import com.DuAn.dentistApp.model.request.CTResultAbnormalityRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.AbnormalityRepository;
import com.DuAn.dentistApp.repositories.AppointmentCTResultRepository;
import com.DuAn.dentistApp.repositories.CTResultAbnormalityRepository;
import com.DuAn.dentistApp.service.service.CTResultAbnormalityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CTResultAbnormalityServiceImpl implements CTResultAbnormalityService {
    @Autowired
    CTResultAbnormalityRepository ctResultAbnormalityRepository;
    @Autowired
    AppointmentCTResultRepository appointmentCTResultRepository;
    @Autowired
    AbnormalityRepository abnormalityRepository;

    @Override
    public CTResultAbnormality findByCTResultAbnormalityId(int cTResultAbnormalityId) {
        return ctResultAbnormalityRepository.findById(cTResultAbnormalityId).orElseThrow(null);
    }

    @Override
    public List<CTResultAbnormality> findAllCTResultAbnormality() {
        return ctResultAbnormalityRepository.findAll() ;
    }

    @Override
    public List<CTResultAbnormality> findAllCTResultAbnormalityExceptDeleted() {
        return ctResultAbnormalityRepository.findAll().stream()
                .filter(cTResultAbnormality -> !cTResultAbnormality.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public CTResultAbnormality saveCTResultAbnormality(CTResultAbnormalityRequest ctResultAbnormalityRequest) {
        var cTResultAbnormality = CTResultAbnormality
                                          .builder()
                                          .Description(ctResultAbnormalityRequest.getDescription())
                                          .abnormality(abnormalityRepository.findById(ctResultAbnormalityRequest.getAbnormalityId()).orElse(null))
                                          .appointmentCTResult(appointmentCTResultRepository.findById(ctResultAbnormalityRequest.getAppointmentCTResult()).orElse(null))
                                          .build();
        ctResultAbnormalityRepository.save(cTResultAbnormality);
        return cTResultAbnormality;
    }

    @Override
    public CTResultAbnormality updateCTResultAbnormality(int cTResultAbnormalityId, CTResultAbnormalityRequest ctResultAbnormalityRequest) {
        var cTResultAbnormality = CTResultAbnormality
                                          .builder()
                                          .cTResultAbnormalityId(cTResultAbnormalityId)
                                          .Description(ctResultAbnormalityRequest.getDescription())
                                          .abnormality(abnormalityRepository.findById(ctResultAbnormalityRequest.getAbnormalityId()).orElse(null))
                                          .appointmentCTResult(appointmentCTResultRepository.findById(ctResultAbnormalityRequest.getAppointmentCTResult()).orElse(null))
                                          .build();
        ctResultAbnormalityRepository.save(cTResultAbnormality);
        return cTResultAbnormality;
    }

    @Override
    public MessageResponse delete(int cTResultAbnormalityId) {
        try {
            ctResultAbnormalityRepository.deleteById(cTResultAbnormalityId);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeleteCTResultAbnormality(int cTResultAbnormalityId) {
        try {
            var cTResultAbnormality = ctResultAbnormalityRepository.findById(cTResultAbnormalityId)
                                              .orElseThrow(() -> new RuntimeException("cT Result Abnormality not found"));
            cTResultAbnormality.setDeleted(true);
            ctResultAbnormalityRepository.save(cTResultAbnormality);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }

    @Override
    public List<CTResultAbnormality> findCTResultAbnormalityByAppointmentId(Integer appId) {
        return ctResultAbnormalityRepository.getCTResultAbnormalityByAppointmentId(appId);
    }
}
