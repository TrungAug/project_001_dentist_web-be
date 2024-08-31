package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.model.request.ServiceRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.ServiceRepository;
import com.DuAn.dentistApp.repositories.ServiceTypeRepository;
import com.DuAn.dentistApp.service.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ServiceServiceImpl implements ServiceService {
    @Autowired
    ServiceRepository serviceRepository;
    @Autowired
    ServiceTypeRepository serviceTypeRepository;

    @Override
    public com.DuAn.dentistApp.entities.Service findByServiceId(int serviceId) {
        return serviceRepository.findById(serviceId).orElseThrow(null);
    }

    @Override
    public List<com.DuAn.dentistApp.entities.Service> findAllService() {
        return serviceRepository.findAll() ;
    }

    @Override
    public List<com.DuAn.dentistApp.entities.Service> findAllServiceExceptDeleted() {
        return serviceRepository.findAll().stream()
                .filter(service -> !service.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public com.DuAn.dentistApp.entities.Service saveService(ServiceRequest serviceRequest) {
        var service = com.DuAn.dentistApp.entities.Service
                              .builder()
                              .serviceName(serviceRequest.getServiceName())
                              .price(serviceRequest.getPrice())
                              .imageURL(serviceRequest.getImageURL())
                              .timeEstimate(serviceRequest.getTimeEstimate())
                              .serviceType(serviceTypeRepository.findById(serviceRequest.getServiceTypeId()).orElse(null))
                              .description(serviceRequest.getDescription())
                              .build();
        serviceRepository.save(service);
        return service;
    }

    @Override
    public com.DuAn.dentistApp.entities.Service updateService(int serviceId, ServiceRequest serviceRequest) {
        var service = com.DuAn.dentistApp.entities.Service
                              .builder()
                              .serviceId(serviceId)
                              .serviceName(serviceRequest.getServiceName())
                              .imageURL(serviceRequest.getImageURL())
                              .price(serviceRequest.getPrice())
                              .timeEstimate(serviceRequest.getTimeEstimate())
                              .serviceType(serviceTypeRepository.findById(serviceRequest.getServiceTypeId()).orElse(null))
                              .description(serviceRequest.getDescription())
                              .build();
        serviceRepository.save(service);
        return service;
    }

    @Override
    public MessageResponse delete(int serviceId) {
        try {
            serviceRepository.deleteById(serviceId);
            return new MessageResponse("successfully");
        }catch (Exception e){
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeleteService(int serviceId) {
        try {
            var service = serviceRepository.findById(serviceId)
                                  .orElseThrow(() -> new RuntimeException("service not found"));
            service.setDeleted(true) ;
            serviceRepository.save(service);
            return new MessageResponse("successfully");
        }catch (Exception e){
            return new MessageResponse("fail");
        }
    }

    @Override
    public List<Object> findServiceByDentalIssues(List<Integer> ids) {
        return serviceRepository.getServiceByDentalIssues(ids);
    }
}
