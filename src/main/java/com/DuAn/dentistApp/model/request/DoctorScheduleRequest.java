package com.DuAn.dentistApp.model.request;

import lombok.Data;

import java.util.Date;

@Data
public class DoctorScheduleRequest {

    private Date createAt;

    private Date updateAt;

    private Date date;

    private Boolean isAvailable;

    private Integer shiftId;

    private Integer doctorId;
}
