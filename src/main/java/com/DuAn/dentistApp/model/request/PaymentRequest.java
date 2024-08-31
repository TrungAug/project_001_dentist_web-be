package com.DuAn.dentistApp.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentRequest {
    private int appointmentId;

    private String text;

    private String paymentMethod;
}
