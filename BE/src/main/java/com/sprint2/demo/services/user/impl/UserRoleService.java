package com.sprint2.demo.services.user.impl;

import com.sprint2.demo.models.UserRole;
import com.sprint2.demo.repository.user.IUserRoleRepository;
import com.sprint2.demo.services.user.IUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleService implements IUserRoleService {
    @Autowired
    private IUserRoleRepository iUserRoleRepository;

    @Override
    public UserRole findUserRole(String username) {
        return this.iUserRoleRepository.findAllByUsers_Username(username);
    }

    @Override
    public void saveUserRole(UserRole userRole) {
        this.iUserRoleRepository.save(userRole);
    }

}
