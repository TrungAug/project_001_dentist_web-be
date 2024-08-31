package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Appointment;
import com.DuAn.dentistApp.model.request.AppointmentRequest;
import com.DuAn.dentistApp.model.response.AppointmentWithServicesResponse;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface AppointmentService {
    Appointment findByAppointmentId(int appointmentId);

    List<Appointment> findAllAppointment();

    List<Appointment> findAllAppointmentExceptDeleted();

    Appointment saveAppointment(AppointmentRequest appointmentRequest);

    Appointment updateAppointment(int appointmentId, AppointmentRequest appointmentRequest);

    MessageResponse delete(int appointmentId);

    MessageResponse softDeleteAppointment(int appointmentId);


    List<AppointmentWithServicesResponse> findAllAppointmentService();

    List<AppointmentWithServicesResponse> findAllBillCancel();

    AppointmentWithServicesResponse findAppointmentServiceByAppointmentId(int appointmentId);

    List<AppointmentWithServicesResponse> findAllAppointmentService(String startDate, String endDate);


    List<Object> findAllDateOfAppointment();

    List<Appointment> findAppointmentByDate(Date date);

    List<Appointment> findAllAppByTimeRange(Date startDate, Date endDate);

    Map<Date, List<Appointment>> findAllAppGroupByDate(Date startDate, Date endDate, List<Integer> patientIds, List<Integer> doctorIds);


    List<Appointment> findAllAppByPatient(Date now, Integer patientId);

    List<Appointment> findAppointmentsByDateMonthYear(Integer date ,Integer month,Integer year);

    List<Appointment> findAppointmentWithOutBill(Integer appStatus);

    List<Appointment> findAppointmentWithOutCtresult();
}
