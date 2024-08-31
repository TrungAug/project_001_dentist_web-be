package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.ServiceTreatment;
import com.DuAn.dentistApp.model.request.ServiceTreatmentRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface ServiceTreatmentService {
    ServiceTreatment findByServiceTreatment(int serviceTreatment);

    List<ServiceTreatment> findAllServiceTreatment();

    List<ServiceTreatment> findAllServiceTreatmentExceptDeleted();

    ServiceTreatment saveServiceTreatment(ServiceTreatmentRequest serviceTreatmentRequest);

    ServiceTreatment updateServiceTreatment(int serviceTreatmentId, ServiceTreatmentRequest serviceTreatmentRequest);

    MessageResponse delete(int serviceTreatmentId);

    MessageResponse softDeleteServiceTreatment(int serviceTreatmentId);
}
