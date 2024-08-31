package com.DuAn.dentistApp.model.response;

import com.DuAn.dentistApp.entities.Medicines;
import com.DuAn.dentistApp.entities.Prescription;
import com.DuAn.dentistApp.entities.PrescriptionMedicines;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PrescriptionWithMedicinesResponse {
    private Prescription prescription;
    private List<Medicines> medicinesList;
    private List<PrescriptionMedicines> prescriptionMedicinesList;
}
