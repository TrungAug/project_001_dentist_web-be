package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.DentalStaff;
import com.DuAn.dentistApp.entities._enum.Gender;
import com.DuAn.dentistApp.model.request.DentalStaffRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.DentalStaffRepository;
import com.DuAn.dentistApp.repositories.DepartmentRepository;
import com.DuAn.dentistApp.service.service.DentalStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DentalStaffServiceImpl implements DentalStaffService {
    @Autowired
    DentalStaffRepository dentalStaffRepository;
    @Autowired
    DepartmentRepository departmentRepository;

    @Override
    public DentalStaff findByDentalStaffId(int dentalStaffId) {
        return dentalStaffRepository.findById(dentalStaffId).orElseThrow(null);
    }

    @Override
    public List<DentalStaff> findAllDentalStaff() {
        return dentalStaffRepository.findAll(Sort.by(Sort.Direction.DESC,"dentalStaffId"));
    }

    @Override
    public List<DentalStaff> findAllDentalStaffExceptDeleted() {
        return dentalStaffRepository.findAll().stream()
                .filter(dentalStaff -> !dentalStaff.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public DentalStaff saveDentalStaff(DentalStaffRequest dentalStaffRequest) {
        var dentalStaff = DentalStaff
                                  .builder()
                                  .department(departmentRepository.findById(dentalStaffRequest.getDepartmentId()).orElse(null))
                                  .fullname(dentalStaffRequest.getFullName())
                                  .phoneNumber(dentalStaffRequest.getPhoneNumber())
                                  .address(dentalStaffRequest.getAddress())
                                  .birthday(dentalStaffRequest.getBirthday())
                                  .imageURL(dentalStaffRequest.getImageURL())
                                  .gender(Gender.valueOf(dentalStaffRequest.getGender()))
                                  .build();
        dentalStaffRepository.save(dentalStaff);
        return dentalStaff;
    }

    @Override
    public DentalStaff updateDentalStaff(int dentalStaffId, DentalStaffRequest dentalStaffRequest) {
        var dentalStaff = DentalStaff
                                  .builder()
                                  .dentalStaffId(dentalStaffId)
                                  .department(departmentRepository.findById(dentalStaffRequest.getDepartmentId()).orElse(null))
                                  .fullname(dentalStaffRequest.getFullName())
                                  .phoneNumber(dentalStaffRequest.getPhoneNumber())
                                  .address(dentalStaffRequest.getAddress())
                                  .birthday(dentalStaffRequest.getBirthday())
                                  .imageURL(dentalStaffRequest.getImageURL())
                                  .gender(Gender.valueOf(dentalStaffRequest.getGender()))
                                  .build();
        dentalStaffRepository.save(dentalStaff);
        return dentalStaff;
    }

    @Override
    public MessageResponse delete(int dentalStaffId) {
        try {
            dentalStaffRepository.deleteById(dentalStaffId);
            return new MessageResponse("successfully");
        }catch (Exception e)
        {
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeleteDentalStaff(int dentalStaffId) {
        try {
            var dentalStaff = dentalStaffRepository.findById(dentalStaffId)
                                      .orElseThrow(() -> new RuntimeException("dental Staff not found"));
            dentalStaff.setDeleted(true);
            dentalStaffRepository.save(dentalStaff);
            return new MessageResponse("successfully");
        }catch (Exception e)
        {
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }
}
