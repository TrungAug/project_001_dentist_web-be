package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DentalStaff;
import com.DuAn.dentistApp.model.request.DentalStaffRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DentalStaffService {
    DentalStaff findByDentalStaffId(int dentalStaffId);

    List<DentalStaff> findAllDentalStaff();

    List<DentalStaff> findAllDentalStaffExceptDeleted();

    DentalStaff saveDentalStaff(DentalStaffRequest dentalStaffRequest);

    DentalStaff updateDentalStaff(int dentalStaffId, DentalStaffRequest dentalStaffRequest);

    MessageResponse delete(int dentalStaffId);

    MessageResponse softDeleteDentalStaff(int dentalStaffId);
}
