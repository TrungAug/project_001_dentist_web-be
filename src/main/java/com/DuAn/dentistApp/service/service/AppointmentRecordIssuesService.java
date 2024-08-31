package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentRecordIssues;
import com.DuAn.dentistApp.model.request.AppointmentRecordIssuesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentRecordIssuesService {
    AppointmentRecordIssues findByAppointmentRecordIssuesId(int appointmentRecordIssuesId);

    List<AppointmentRecordIssues> findAllAppointmentRecordIssues();

    List<AppointmentRecordIssues> findAllAppointmentRecordIssuesExceptDeleted();

    AppointmentRecordIssues saveAppointmentRecordIssues(AppointmentRecordIssuesRequest appointmentRecordIssuesRequest);

    AppointmentRecordIssues updateAppointmentRecordIssues(int appointmentRecordIssuesId, AppointmentRecordIssuesRequest appointmentRecordIssuesRequest);

    MessageResponse delete(int appointmentRecordIssuesId);

    MessageResponse softDeleteAppointmentRecordIssues(int appointmentRecordIssuesId);
}
