package com.DuAn.dentistApp.model.response;

import lombok.Data;

import java.util.List;
@Data
public class TransactionResponse {
    private int status;
    private String error;
    private boolean success;
    private Integer appointmentId;
    private List<Transaction> transactions;

}
