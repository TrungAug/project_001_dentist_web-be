package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class FrequencyMedicineRequest {
    private int medicinesId;
    private int frequencyId;
    private String description;
}
