package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DentalSuppliesAppointment;
import com.DuAn.dentistApp.model.request.DentalSuppliesAppointmentRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DentalSuppliesAppointmentService {

    DentalSuppliesAppointment findDentalSuppliesAppointmentById(Integer dentalSupplies_AppointmentId);

    List<DentalSuppliesAppointment> findAllDentalSuppliesAppointmentExceptDeleted();

    List<DentalSuppliesAppointment> findDentalSuppliesByAppointment(Integer appoinmentId);

    DentalSuppliesAppointment saveReq(DentalSuppliesAppointmentRequest dentalSuppliesAppointmentRequest);

    DentalSuppliesAppointment updateReq(Integer dentalSupplies_AppointmentId,DentalSuppliesAppointmentRequest dentalSuppliesAppointmentRequest);

    MessageResponse deleteReq(Integer dentalSupplies_AppointmentId);

    MessageResponse softDeleteDentalSuppliesAppointment(Integer dentalSupplies_AppointmentId);
}
