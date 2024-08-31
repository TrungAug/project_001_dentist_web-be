package com.DuAn.dentistApp.model.request;

import lombok.Data;

import java.time.LocalTime;

@Data
public class ShiftRequest {

    private String shiftName;

    private String description;

    private LocalTime beginTime;

    private LocalTime endTime;
}
