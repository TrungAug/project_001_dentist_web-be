package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentService;
import com.DuAn.dentistApp.model.request.AppointmentServiceRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentServiceService {
    AppointmentService findByAppointmentServiceId(int appointmentId);

    List<AppointmentService> findByAppointmentServiceByAppointmentId(int appointmentId);

    List<AppointmentService> findAllAppointmentService();

    List<AppointmentService> findAllAppointmentServiceExceptDeleted();

    AppointmentService saveAppointmentService(AppointmentServiceRequest appointmentServiceRequest);

    AppointmentService updateAppointmentService(int appointmentServiceId, AppointmentServiceRequest appointmentServiceRequest);

    MessageResponse delete(int appointmentServiceId);

    MessageResponse softDeleteAppointmentService(int appointmentServiceId);

    List<AppointmentService> findAppointmentServiceByAppId(Integer appointmentId);
}
