package com.sprint2.demo.services.user.impl;


import com.sprint2.demo.dto.user.payload.SignUpRequest;
import com.sprint2.demo.models.Customer;
import com.sprint2.demo.models.Roles;
import com.sprint2.demo.models.UserRole;
import com.sprint2.demo.models.Users;
import com.sprint2.demo.repository.customer.ICustomerRepository;
import com.sprint2.demo.repository.user.IRoleRepository;
import com.sprint2.demo.repository.user.IUserRoleRepository;
import com.sprint2.demo.repository.user.IUsersRepository;
import com.sprint2.demo.services.user.IUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class UsersService implements IUsersService {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private IUsersRepository iUsersRepository;
    @Autowired
    private ICustomerRepository iCustomerRepository;

    @Autowired
    private IUserRoleRepository iUserRoleRepository;

    @Autowired
    private IRoleRepository iRoleRepository;


    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function format Date, and save data for customer when sign up
     */
    @Override
    public void saveUsers(SignUpRequest signUpRequest) {
            Users users = new Users(signUpRequest.getEmail(),passwordEncoder.encode(signUpRequest.getPassword()));
            users.setFlag(true);

            Customer customer = new Customer();
            customer.setName(signUpRequest.getName());
            customer.setBirthday(signUpRequest.getDayOfBirth());
            customer.setAddress(signUpRequest.getAddress());
            customer.setPhone(signUpRequest.getPhone());
            customer.setGender(signUpRequest.getGender());
            customer.setUsername(users);
            Roles roles = this.iRoleRepository.findRolesByRoleName("ROLE_USER");
            UserRole userRole = new UserRole(users,roles);
            this.iUsersRepository.save(users);
            this.iUserRoleRepository.save(userRole);
            this.iCustomerRepository.save(customer);
    }

    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function Create new User for facebook login first time
     */

    public UsersDetails processOAuthPostLogin(String username, Map<String,Object> attributes) {
        Users existUser = this.iUsersRepository.getUserByUsername(username);
        if (existUser == null) {
            Users newUser = new Users();
            newUser.setUsername(username);
//            newUser.setProvider(Provider.FACEBOOK);
            newUser.setFlag(true);
            this.iUsersRepository.save(newUser);
        }

        return UsersDetails.create(existUser,attributes);

    }

    @Override
    public void saveUser(Users users) {
        this.iUsersRepository.save(users);
    }


    @Override
    public List<Users> checkEmail(String email) {
        return this.iUsersRepository.checkEmail(email);
    }
}
