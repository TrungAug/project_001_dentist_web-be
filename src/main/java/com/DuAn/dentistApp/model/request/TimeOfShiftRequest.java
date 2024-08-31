package com.DuAn.dentistApp.model.request;

import lombok.Data;

import java.time.LocalTime;

@Data
public class TimeOfShiftRequest {


    private LocalTime beginTime;

    private LocalTime endTime;

    private Integer shiftId;

}
