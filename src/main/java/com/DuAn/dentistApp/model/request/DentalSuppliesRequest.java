package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class DentalSuppliesRequest {

    private String suppliesName;

    private String description;

    private int DistributionSuppliesId;
}
