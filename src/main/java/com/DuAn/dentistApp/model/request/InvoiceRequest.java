package com.DuAn.dentistApp.model.request;


import com.DuAn.dentistApp.entities.Appointment;
import com.DuAn.dentistApp.entities.Service;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InvoiceRequest {
    private Appointment appointment;
    private List<Service> services;
    private int patientAge;
    private String text;
    private double totalAmount;
    private boolean status;


}
