package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class DentalSuppliesAppointmentRequest {

    private int quantity;
    private int dentalSupplyId;
    private int appointmentId;
    private boolean isDelete;

}
