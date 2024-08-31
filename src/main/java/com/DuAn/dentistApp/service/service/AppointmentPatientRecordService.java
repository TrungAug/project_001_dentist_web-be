package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentPatientRecord;
import com.DuAn.dentistApp.model.request.AppointmentPatientRecordRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentPatientRecordService {

    AppointmentPatientRecord findByAppointmentPatientRecordId(int appointmentPatientRecordId);

    List<AppointmentPatientRecord> findAllAppointmentPatientRecord();

    List<AppointmentPatientRecord> findAllAppointmentPatientRecordExceptDeleted();

    AppointmentPatientRecord saveAppointmentPatientRecord(AppointmentPatientRecordRequest AppointmentPatientRecordRequest);

    AppointmentPatientRecord updateAppointmentPatientRecord(int appointmentTypeId, AppointmentPatientRecordRequest AppointmentPatientRecordRequest);

    MessageResponse delete(int appointmentPatientRecordId);

    MessageResponse softDeleteAppointmentType(int appointmentPatientRecordId);
}
