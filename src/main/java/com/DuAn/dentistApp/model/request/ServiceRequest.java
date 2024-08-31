package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class ServiceRequest {

    private String serviceName;

    private double price;

    private int timeEstimate;

    private int serviceTypeId;

    private String imageURL;

    private String description;

}
