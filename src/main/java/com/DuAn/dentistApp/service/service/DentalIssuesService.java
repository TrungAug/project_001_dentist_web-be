package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DentalIssues;
import com.DuAn.dentistApp.model.request.DentalIssuesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DentalIssuesService {
    DentalIssues findByDentalIssuesId(int dentalIssuesId);

    List<DentalIssues> findAllDentalIssues();

    List<DentalIssues> findAllDentalIssuesExceptDeleted();

    DentalIssues saveDentalIssues(DentalIssuesRequest dentalIssuesRequest);

    DentalIssues updateDentalIssues(int dentalIssuesId, DentalIssuesRequest dentalIssuesRequest);

    MessageResponse delete(int dentalIssuesId);

    MessageResponse softDeleteDentalIssues(int dentalIssuesId);
}
