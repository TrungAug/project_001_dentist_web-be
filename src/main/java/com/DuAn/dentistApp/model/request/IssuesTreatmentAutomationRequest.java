package com.DuAn.dentistApp.model.request;

import lombok.Data;

@Data
public class IssuesTreatmentAutomationRequest {

    private int issuesId;

    private int treatmentId;

    private String description;
}
