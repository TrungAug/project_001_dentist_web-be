package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class ServiceTreatmentRequest {

    private int serviceId;

    private int treatment;

    private String description;
}
