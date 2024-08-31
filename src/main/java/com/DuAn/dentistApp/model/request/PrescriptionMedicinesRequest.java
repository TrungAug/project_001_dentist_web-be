package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class PrescriptionMedicinesRequest {
    private String prescriptionMedicines;
    private String frequency;
    private Integer prescriptionId;
    private Integer medicinesId;
}
