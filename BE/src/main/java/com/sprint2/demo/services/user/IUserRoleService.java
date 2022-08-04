package com.sprint2.demo.services.user;


import com.sprint2.demo.models.UserRole;

public interface IUserRoleService {
    UserRole findUserRole(String roleName);

    void saveUserRole(UserRole userRole);

}
