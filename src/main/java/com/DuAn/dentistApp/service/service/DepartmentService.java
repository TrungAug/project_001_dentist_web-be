package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Department;
import com.DuAn.dentistApp.model.request.DepartmentRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DepartmentService {
    Department findByDepartmentId(int departmentId);

    List<Department> findAllDepartment();

    List<Department> findAllDepartmentExceptDeleted();

    Department saveDepartment(DepartmentRequest departmentRequest);

    Department updateDepartment(int departmentId, DepartmentRequest departmentRequest);

    MessageResponse delete(int departmentId);

    MessageResponse softDeleteDepartment(int departmentId);
}
