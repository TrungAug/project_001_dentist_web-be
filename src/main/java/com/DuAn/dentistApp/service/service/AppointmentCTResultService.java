package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentCTResult;
import com.DuAn.dentistApp.model.request.AppointmentCTResultRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface AppointmentCTResultService {
    AppointmentCTResult findByAppointmentCTResultId(int appointmentCTResultId);

    List<AppointmentCTResult> findAll();

    List<AppointmentCTResult> findAllExceptDeleted();

    AppointmentCTResult saveAppointmentCTResult(AppointmentCTResultRequest appointmentCTResultRequest);

    AppointmentCTResult updateAppointmentCTResult(int appointmentCTResultId, AppointmentCTResultRequest appointmentCTResultRequest);

    MessageResponse deleteById(int AppointmentCTResultId);

    MessageResponse softDeleteAppointmentCTResult(int AppointmentCTResultId);

    List<AppointmentCTResult> findAppointmentCTResultByAppId(Integer appId);
}
