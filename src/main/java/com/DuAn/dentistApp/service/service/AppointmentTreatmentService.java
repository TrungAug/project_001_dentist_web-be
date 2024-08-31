package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentTreatment;
import com.DuAn.dentistApp.model.request.AppointmentTreatmentRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentTreatmentService {

    AppointmentTreatment findByAppointmentTreatmentId(int appointmentTreatmentId);

    List<AppointmentTreatment> findAllAppointmentTreatment();

    List<AppointmentTreatment> findAllAppointmentTreatmentExceptDeleted();


    AppointmentTreatment saveAppointmentTreatment(AppointmentTreatmentRequest appointmentTreatmentRequest);

    AppointmentTreatment updateAppointmentTreatment(int appointmentTreatmentId, AppointmentTreatmentRequest appointmentTreatmentRequest);

    MessageResponse delete(int appointmentTreatmentId);

    MessageResponse softDeleteAppointmentTreatment(int appointmentTreatmentId);
}
