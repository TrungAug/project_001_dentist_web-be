package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Specialty;
import com.DuAn.dentistApp.model.request.SpecialtyRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface SpecialtyService {
    Specialty findBySpecialtyId(int SpecialtyId);

    List<Specialty> findAllSpecialty();

    List<Specialty> findAllSpecialtyExceptDeleted();

    Specialty saveSpecialty(SpecialtyRequest specialtyRequest);

    Specialty updateSpecialty(int specialtyId, SpecialtyRequest specialtyRequest);

    MessageResponse delete(int specialtyId);

    MessageResponse softDeleteSpecialty(int specialtyId);
}
