package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentType;
import com.DuAn.dentistApp.model.request.AppointmentTypeRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentTypeService {
    AppointmentType findByAppointmentTypeId(int appointmentTypeId);

    List<AppointmentType> findAllAppointmentType();

    List<AppointmentType> findAllAppointmentTypeExceptDeleted();

    AppointmentType saveAppointmentType(AppointmentTypeRequest appointmentTypeRequest);

    AppointmentType updateAppointmentType(int appointmentTypeId, AppointmentTypeRequest appointmentTypeRequest);

    MessageResponse delete(int appointmentTypeId);

    MessageResponse softDeleteAppointmentType(int appointmentTypeId);
}
