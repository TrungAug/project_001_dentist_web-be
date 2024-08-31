package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class DoctorRequest {

    private String degrees;

    private String signature;

    private String fullName;

    private String phoneNumber;

    private String address;

    private String birthday;

    private String image;

    private String gender;

    private int specialtyId;
}
