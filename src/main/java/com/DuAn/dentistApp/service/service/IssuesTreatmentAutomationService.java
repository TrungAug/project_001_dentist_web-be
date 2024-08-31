package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.IssuesTreatmentAutomation;
import com.DuAn.dentistApp.model.request.IssuesTreatmentAutomationRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface IssuesTreatmentAutomationService {
    IssuesTreatmentAutomation findByIssuesTreatmentAutomationId(int issuesTreatmentAutomationId);

    List<IssuesTreatmentAutomation> findAllIssuesTreatmentAutomation();

    List<IssuesTreatmentAutomation> findAllIssuesTreatmentAutomationExceptDeleted();

    IssuesTreatmentAutomation saveIssuesTreatmentAutomation(IssuesTreatmentAutomationRequest issuesTreatmentAutomationRequest);

    IssuesTreatmentAutomation updateIssuesTreatmentAutomation(int issuesTreatmentAutomationId, IssuesTreatmentAutomationRequest issuesTreatmentAutomationRequest);

    MessageResponse delete(int issuesTreatmentAutomationId);

    MessageResponse softDeleteIssuesTreatmentAutomation(int issuesTreatmentAutomationId);
}
