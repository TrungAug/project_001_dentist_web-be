package com.DuAn.dentistApp.model.response;


import com.DuAn.dentistApp.entities.Appointment;
import com.DuAn.dentistApp.entities.Service;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AppointmentWithServicesResponse {
    private Appointment appointment;
    private List<Service> services;
    private Integer billId;
    private boolean status;


}
