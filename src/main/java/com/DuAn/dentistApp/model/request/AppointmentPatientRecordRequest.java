package com.DuAn.dentistApp.model.request;

import lombok.Data;

import java.util.Date;

@Data
public class AppointmentPatientRecordRequest {

    private int patientId;
    private Date createAt;
    private String currentCondition;

    private String reExamination;

    private boolean isDeleted;
}
