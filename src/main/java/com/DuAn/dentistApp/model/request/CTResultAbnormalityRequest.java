package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class CTResultAbnormalityRequest {

    private String description;

    private int abnormalityId;

    private int appointmentCTResult;

}
