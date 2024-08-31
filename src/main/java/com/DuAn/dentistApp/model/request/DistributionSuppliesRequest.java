package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class DistributionSuppliesRequest {

    private  String distribution;

    private String  name;

    private String address;

    private  String contactPerson;

    private String email;

    private String  note;

    private String taxCode;
}
