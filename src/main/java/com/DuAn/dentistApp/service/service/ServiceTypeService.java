package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.ServiceType;
import com.DuAn.dentistApp.model.request.ServiceTypeRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface ServiceTypeService {
    ServiceType findByServiceTypeId(int serviceTypeId);

    List<ServiceType> findAllServiceType();

    List<ServiceType> findAllServiceTypeExceptDeleted();

    ServiceType saveServiceType(ServiceTypeRequest serviceTypeRequest);

    ServiceType updateServiceType(int serviceTypeId, ServiceTypeRequest serviceTypeRequest);

    MessageResponse delete(int serviceTypeId);

    MessageResponse softDeleteServiceType(int serviceTypeId);
}
