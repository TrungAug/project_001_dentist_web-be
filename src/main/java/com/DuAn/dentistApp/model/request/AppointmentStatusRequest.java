package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class AppointmentStatusRequest {

    private String status;

    private String description;
}
