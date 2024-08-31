package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DentalSupplies;
import com.DuAn.dentistApp.model.request.DentalSuppliesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DentalSuppliesService {
    DentalSupplies findByDentalSuppliesId(int dentalSuppliesId);

    List<DentalSupplies> findAllDentalSupplies();

    List<DentalSupplies> findAllDentalSuppliesExceptDeleted();

    DentalSupplies saveDentalSupplies(DentalSuppliesRequest dentalSuppliesRequest);

    DentalSupplies updateDentalSupplies(int dentalSuppliesId, DentalSuppliesRequest dentalSuppliesRequest);

    MessageResponse delete(int dentalSuppliesId);

    MessageResponse softDeleteDentalSupplies(int dentalSuppliesId);
}
