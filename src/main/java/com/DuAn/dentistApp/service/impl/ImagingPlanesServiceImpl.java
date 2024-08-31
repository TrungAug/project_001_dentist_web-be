package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.ImagingPlanes;
import com.DuAn.dentistApp.model.request.ImagingPlanesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.ImagingPlanesRepository;
import com.DuAn.dentistApp.service.service.ImagingPlanesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ImagingPlanesServiceImpl implements ImagingPlanesService {
    @Autowired
    ImagingPlanesRepository imagingPlanesRepository;

    @Override
    public ImagingPlanes findByImagingPlanesId(int imagingPlanesId) {
        return imagingPlanesRepository.findById(imagingPlanesId).orElseThrow(null);
    }

    @Override
    public List<ImagingPlanes> findAllImagingPlanes() {
        return imagingPlanesRepository.findAll() ;
    }

    @Override
    public List<ImagingPlanes> findAllImagingPlanesExceptDeleted() {
        return imagingPlanesRepository.findAll().stream()
                .filter(imagingPlanes -> !imagingPlanes.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public ImagingPlanes saveImagingPlanes(ImagingPlanesRequest imagingPlanesRequest) {
        var imagingPlanes = ImagingPlanes
                                    .builder()
                                    .name(imagingPlanesRequest.getName())
                                    .description(imagingPlanesRequest.getDescription())
                                    .build();
        imagingPlanesRepository.save(imagingPlanes);
        return imagingPlanes;
    }

    @Override
    public ImagingPlanes updateImagingPlanes(int imagingPlanesId, ImagingPlanesRequest imagingPlanesRequest) {
        var imagingPlanes = ImagingPlanes
                                  .builder()
                                  .imagingPlanesId(imagingPlanesId)
                                  .name(imagingPlanesRequest.getName())
                                  .description(imagingPlanesRequest.getDescription())
                                  .build();
        imagingPlanesRepository.save(imagingPlanes);
        return imagingPlanes;
    }

    @Override
    public MessageResponse delete(int imagingPlanesId) {
        try {
            imagingPlanesRepository.deleteById(imagingPlanesId);
            return new MessageResponse("successfully");
        }catch (Exception e){
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeletePlanesService(int imagingPlanesId) {
        try {
            ImagingPlanes imagingPlanes = imagingPlanesRepository.findById(imagingPlanesId)
                                                  .orElseThrow(() -> new RuntimeException("imaging Planes not found"));
            imagingPlanes.setDeleted(true) ;
            imagingPlanesRepository.save(imagingPlanes) ;
            return new MessageResponse("Successfully") ;
        } catch (Exception e) {
            e.printStackTrace();
            return new MessageResponse("Failed") ;
        }
    }
}
