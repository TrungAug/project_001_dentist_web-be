package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class AppointmentTreatmentRequest {
    private int appointPatientRecordId;

    private int treatmentId;

    private String description;

}
