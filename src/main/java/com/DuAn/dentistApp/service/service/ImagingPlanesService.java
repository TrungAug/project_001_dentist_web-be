package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.ImagingPlanes;
import com.DuAn.dentistApp.model.request.ImagingPlanesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface ImagingPlanesService {
    ImagingPlanes findByImagingPlanesId(int imagingPlanesId);

    List<ImagingPlanes> findAllImagingPlanes();

    List<ImagingPlanes> findAllImagingPlanesExceptDeleted();

    ImagingPlanes saveImagingPlanes(ImagingPlanesRequest imagingPlanesRequest);

    ImagingPlanes updateImagingPlanes(int imagingPlanesId, ImagingPlanesRequest imagingPlanesRequest);

    MessageResponse delete(int imagingPlanesId);
    MessageResponse softDeletePlanesService(int imagingPlanesId);
}
