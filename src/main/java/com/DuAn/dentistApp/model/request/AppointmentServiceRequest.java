package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class AppointmentServiceRequest {
    private int appointmentId;

    private int serviceId;

    private Integer quantity;

    private double price;
}
