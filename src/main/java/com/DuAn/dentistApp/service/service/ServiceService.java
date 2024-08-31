package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Service;
import com.DuAn.dentistApp.model.request.ServiceRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface ServiceService {
    Service findByServiceId(int serviceId);

    List<Service> findAllService();

    List<Service> findAllServiceExceptDeleted();

    Service saveService(ServiceRequest serviceRequest);

    Service updateService(int serviceId, ServiceRequest serviceRequest);

    MessageResponse delete(int serviceId);

    MessageResponse softDeleteService(int serviceId);

    List<Object> findServiceByDentalIssues(List<Integer> ids);
}
