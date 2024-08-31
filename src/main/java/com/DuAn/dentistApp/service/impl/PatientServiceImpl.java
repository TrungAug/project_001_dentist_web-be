package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.Patient;
import com.DuAn.dentistApp.entities._enum.Gender;
import com.DuAn.dentistApp.model.request.PatientRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.PatientRepository;
import com.DuAn.dentistApp.service.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    PatientRepository patientRepository;

    @Override
    public Patient findByPatientId(int PatientId) {
        return patientRepository.findById(PatientId).orElseThrow(null);
    }

    @Override
    public List<Patient> findAllPatient() {
        return patientRepository.findAll() ;
    }

    @Override
    public List<Patient> findAllPatientExceptDeleted() {
        return patientRepository.findAll().stream()
                .filter(patient -> !patient.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public Patient savePatient(PatientRequest patientRequest) {
        var patient = Patient
                .builder()
                .fullName(patientRequest.getFullName())
                .phoneNumber(patientRequest.getPhoneNumber())
                .citizenIdentificationNumber(patientRequest.getCitizenIdentificationNumber())
                .birthday(patientRequest.getBirthday())
                .imageURL(patientRequest.getImageURL())
                .gender(Gender.valueOf(patientRequest.getGender()))
                .address(patientRequest.getAddress())
                .build();
        patientRepository.save(patient);
        return patient;
    }

    @Override
    public Patient updatePatient(int patientId, PatientRequest patientRequest) {
        var patient = Patient
                .builder()
                .patientId(patientId)
                .fullName(patientRequest.getFullName())
                .phoneNumber(patientRequest.getPhoneNumber())
                .citizenIdentificationNumber(patientRequest.getCitizenIdentificationNumber())
                .birthday(patientRequest.getBirthday())
                .imageURL(patientRequest.getImageURL())
                .address(patientRequest.getAddress())
                .gender(Gender.valueOf(patientRequest.getGender()))
                .build();
        patientRepository.save(patient);
        return patient;
    }

    @Override
    public MessageResponse delete(int patientId) {
        try {
            patientRepository.deleteById(patientId);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeletePatient(int patientId) {
        try {
            var patient = patientRepository.findById(patientId)
                    .orElseThrow(() -> new RuntimeException("patient not found"));
            patient.setDeleted(true) ;
            patientRepository.save(patient);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }
}
