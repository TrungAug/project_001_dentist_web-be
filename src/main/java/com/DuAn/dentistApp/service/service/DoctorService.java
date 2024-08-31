package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentStatus;
import com.DuAn.dentistApp.entities.Doctor;
import com.DuAn.dentistApp.model.request.DoctorRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;
import java.util.Map;

public interface DoctorService {
    Doctor findByDoctorId(int DoctorId);

    List<Doctor> findAllDoctor();

    List<Doctor> findAllDoctorExceptDeleted();

    Doctor saveDoctor(DoctorRequest doctorRequest);

    Doctor updateDoctor(int doctorId, DoctorRequest doctorRequest);

    MessageResponse delete(int doctorId);

    MessageResponse softDeleteDoctor(int doctorId);

    List<Doctor> findDoctorBySpecialty(int specialtyId);

    Map<String,List<AppointmentStatus>> findDoctorsWithAppointmentStatus();
}
