package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentStatus;
import com.DuAn.dentistApp.model.request.AppointmentStatusRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentStatusService {

    AppointmentStatus findByAppointmentStatusId(int appointmentStatusId);

    List<AppointmentStatus> findAllAppointmentStatus();

    List<AppointmentStatus> findAllAppointmentStatusExceptDeleted();

    AppointmentStatus saveAppointmentStatus(AppointmentStatusRequest appointmentStatusRequest);

    AppointmentStatus updateAppointmentStatus(int appointmentStatusId, AppointmentStatusRequest appointmentStatusRequest);

    MessageResponse delete(int appointmentStatusId);

    MessageResponse softDeleteAppointmentStatus(int appointmentStatusId);
}
