package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Patient;
import com.DuAn.dentistApp.model.request.PatientRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface PatientService {
    Patient findByPatientId(int PatientId);

    List<Patient> findAllPatient();

    List<Patient> findAllPatientExceptDeleted();

    Patient savePatient(PatientRequest patientRequest);

    Patient updatePatient(int patientId, PatientRequest patientRequest);

    MessageResponse delete(int patientId);

    MessageResponse softDeletePatient(int patientId);
}
