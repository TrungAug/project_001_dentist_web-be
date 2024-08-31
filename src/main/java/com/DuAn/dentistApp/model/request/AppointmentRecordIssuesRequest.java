package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class AppointmentRecordIssuesRequest {
    private int dentalIssuesId;

    private int appointmentPatientRecordId;

    private String description;
}
