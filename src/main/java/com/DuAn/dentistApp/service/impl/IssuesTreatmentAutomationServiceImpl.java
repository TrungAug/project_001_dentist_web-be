package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.IssuesTreatmentAutomation;
import com.DuAn.dentistApp.model.request.IssuesTreatmentAutomationRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.DentalIssuesRepository;
import com.DuAn.dentistApp.repositories.IssuesTreatmentAutomationRepository;
import com.DuAn.dentistApp.repositories.TreatmentRepository;
import com.DuAn.dentistApp.service.service.IssuesTreatmentAutomationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class IssuesTreatmentAutomationServiceImpl implements IssuesTreatmentAutomationService {
    @Autowired
    IssuesTreatmentAutomationRepository issuesTreatmentAutomationRepository;
    @Autowired
    TreatmentRepository treatmentRepository;
    @Autowired
    DentalIssuesRepository dentalIssuesRepository;

    @Override
    public IssuesTreatmentAutomation findByIssuesTreatmentAutomationId(int issuesTreatmentAutomationId) {
        return issuesTreatmentAutomationRepository.findById(issuesTreatmentAutomationId).orElseThrow(null);
    }

    @Override
    public List<IssuesTreatmentAutomation> findAllIssuesTreatmentAutomation() {
        return issuesTreatmentAutomationRepository.findAll() ;
    }

    @Override
    public List<IssuesTreatmentAutomation> findAllIssuesTreatmentAutomationExceptDeleted() {
        return issuesTreatmentAutomationRepository.findAll().stream()
                .filter(issuesTreatmentAutomation -> !issuesTreatmentAutomation.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public IssuesTreatmentAutomation saveIssuesTreatmentAutomation(IssuesTreatmentAutomationRequest issuesTreatmentAutomationRequest) {
        var issuesTreatmentAutomation =IssuesTreatmentAutomation
                                               .builder()
                                               .dentalIssues(dentalIssuesRepository.findById(issuesTreatmentAutomationRequest.getIssuesId()).orElse(null))
                                               .treatment(treatmentRepository.findById(issuesTreatmentAutomationRequest.getTreatmentId()).orElse(null))
                                               .description(issuesTreatmentAutomationRequest.getDescription())
                                               .build();
        issuesTreatmentAutomationRepository.save(issuesTreatmentAutomation);
        return issuesTreatmentAutomation;
    }

    @Override
    public IssuesTreatmentAutomation updateIssuesTreatmentAutomation(int issuesTreatmentAutomationId, IssuesTreatmentAutomationRequest issuesTreatmentAutomationRequest) {
        var issuesTreatmentAutomation =IssuesTreatmentAutomation
                                               .builder()
                                               .IssuesTreatmentAutomationId(issuesTreatmentAutomationId)
                                               .dentalIssues(dentalIssuesRepository.findById(issuesTreatmentAutomationRequest.getIssuesId()).orElse(null))
                                               .treatment(treatmentRepository.findById(issuesTreatmentAutomationRequest.getTreatmentId()).orElse(null))
                                               .description(issuesTreatmentAutomationRequest.getDescription())
                                               .build();
        issuesTreatmentAutomationRepository.save(issuesTreatmentAutomation);
        return issuesTreatmentAutomation;
    }

    @Override
    public MessageResponse delete(int issuesTreatmentAutomationId) {
        try {
            issuesTreatmentAutomationRepository.deleteById(issuesTreatmentAutomationId);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeleteIssuesTreatmentAutomation(int issuesTreatmentAutomationId) {
        try {
            var issuesTreatmentAutomation =issuesTreatmentAutomationRepository.findById(issuesTreatmentAutomationId)
                                                   .orElseThrow(() -> new RuntimeException("issues Treatment Automation not found"));
            issuesTreatmentAutomation.setDeleted(true) ;
            issuesTreatmentAutomationRepository.save(issuesTreatmentAutomation);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }
}
