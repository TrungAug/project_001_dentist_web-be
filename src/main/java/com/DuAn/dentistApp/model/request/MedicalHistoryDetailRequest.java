package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class MedicalHistoryDetailRequest {

    private  int medicalHistoryId;

    private int  patientId;

    private String description;

}
