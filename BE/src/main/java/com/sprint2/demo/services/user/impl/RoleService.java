package com.sprint2.demo.services.user.impl;


import com.sprint2.demo.models.Roles;
import com.sprint2.demo.repository.user.IRoleRepository;
import com.sprint2.demo.services.user.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService implements IRoleService {
    @Autowired
    private IRoleRepository iRoleRepository;

    @Override
    public Roles findRoleByName(String roleUser) {
        return this.iRoleRepository.findAllByName(roleUser);

    }
}
