package com.DuAn.dentistApp.model.request;

import lombok.Data;

import java.util.Date;

@Data

public class PatientRequest {

    private String fullName;

    private String phoneNumber;

    private String citizenIdentificationNumber;

    private Date birthday;

    private String imageURL;

    private String gender;

    private String address;

}
