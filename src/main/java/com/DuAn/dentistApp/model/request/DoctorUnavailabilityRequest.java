package com.DuAn.dentistApp.model.request;

import lombok.Data;

import java.util.Date;

@Data
public class DoctorUnavailabilityRequest {

    private String description ;

    private Integer timeOfShiftId;

    private Date date;

    private Integer appointmentId;

    private boolean isDeleted;

}
