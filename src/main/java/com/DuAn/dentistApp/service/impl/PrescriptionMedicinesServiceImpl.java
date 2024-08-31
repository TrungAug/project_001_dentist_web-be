package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.PrescriptionMedicines;
import com.DuAn.dentistApp.model.request.PrescriptionMedicinesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.MedicinesRepository;
import com.DuAn.dentistApp.repositories.PrescriptionMedicinesRepository;
import com.DuAn.dentistApp.repositories.PrescriptionRepository;
import com.DuAn.dentistApp.service.service.PrescriptionMedicinesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PrescriptionMedicinesServiceImpl implements PrescriptionMedicinesService {

    @Autowired
    private PrescriptionMedicinesRepository prescriptionMedicinesRepository;

    @Autowired
    private PrescriptionRepository prescriptionRepository ;

    @Autowired
    private MedicinesRepository medicinesRepository ;

    @Override
    public PrescriptionMedicines findPrescriptionMedicinesById(int prescriptionMedicinesId) {
        return prescriptionMedicinesRepository.findById(prescriptionMedicinesId).orElse(null);
    }

    @Override
    public List<PrescriptionMedicines> findAllPrescriptionMedicines() {
        return prescriptionMedicinesRepository.findAll() ;
    }

    @Override
    public List<PrescriptionMedicines> findAllPrescriptionMedicinesExceptDeleted() {
        return prescriptionMedicinesRepository.findAll().stream()
                .filter(prescriptionMedicines -> !prescriptionMedicines.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public PrescriptionMedicines savePrescriptionMedicines(PrescriptionMedicinesRequest prescriptionMedicinesRequest) {
        PrescriptionMedicines prescriptionMedicines = PrescriptionMedicines.builder()
                .prescriptionMedicines(prescriptionMedicinesRequest.getPrescriptionMedicines())
                .frequency(prescriptionMedicinesRequest.getFrequency())
                .prescription(prescriptionRepository.findById(prescriptionMedicinesRequest.getPrescriptionId()).orElse(null))
                .medicines(medicinesRepository.findById(prescriptionMedicinesRequest.getMedicinesId()).orElse(null))
                .build();
        prescriptionMedicinesRepository.save(prescriptionMedicines);
        return prescriptionMedicines;
    }

    @Override
    public PrescriptionMedicines updatePrescriptionMedicines(int prescriptionMedicinesId, PrescriptionMedicinesRequest prescriptionMedicinesRequest) {
        PrescriptionMedicines prescriptionMedicines = PrescriptionMedicines.builder()
                .prescriptionMedicinesId(prescriptionMedicinesId)
                .prescriptionMedicines(prescriptionMedicinesRequest.getPrescriptionMedicines())
                .frequency(prescriptionMedicinesRequest.getFrequency())
                .prescription(prescriptionRepository.findById(prescriptionMedicinesRequest.getPrescriptionId()).orElse(null))
                .medicines(medicinesRepository.findById(prescriptionMedicinesRequest.getMedicinesId()).orElse(null))
                .build() ;
        prescriptionMedicinesRepository.save(prescriptionMedicines) ;
        return prescriptionMedicines;
    }

    @Override
    public MessageResponse deletePrescriptionMedicines(int prescriptionMedicinesId) {
        try {
            prescriptionMedicinesRepository.deleteById(prescriptionMedicinesId) ;
            return new MessageResponse("Successfully") ;
        } catch (Exception e) {
            e.printStackTrace();
            return new MessageResponse("Failed") ;
        }
    }

    @Override
    public MessageResponse softDeletePrescriptionMedicines(int prescriptionMedicinesId) {
        try {
            PrescriptionMedicines prescriptionMedicines = prescriptionMedicinesRepository.findById(prescriptionMedicinesId).orElseThrow(() -> new RuntimeException("role not found")) ;
            prescriptionMedicines.setDeleted(true) ;
            prescriptionMedicinesRepository.save(prescriptionMedicines) ;
            return new MessageResponse("Successfully") ;
        } catch (Exception e) {
            e.printStackTrace() ;
            return new MessageResponse("Failed") ;
        }
    }
}
