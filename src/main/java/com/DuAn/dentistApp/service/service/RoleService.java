package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Role;
import com.DuAn.dentistApp.model.request.RoleRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface RoleService {
    Role findByRoleName(String name);
    Role findByRoleId(int roleId);

    List<Role> findAllRole();

    List<Role> findAllRoleExceptDeleted();

    Role saveRole(RoleRequest roleRequest);

    Role updateRole(int roleId, RoleRequest roleRequest);

    MessageResponse delete(int roleId);

    MessageResponse softDeleteRole(int roleId);

}
