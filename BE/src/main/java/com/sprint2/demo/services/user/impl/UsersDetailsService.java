package com.sprint2.demo.services.user.impl;


import com.sprint2.demo.models.Users;
import com.sprint2.demo.repository.user.IUsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UsersDetailsService implements UserDetailsService {

    @Autowired
    private IUsersRepository iUsersRepository;
    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function: this method used to check username when someone login and give back all information and List user authority
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users users = this.iUsersRepository.findByUsername(username);
        if(users == null){
            throw new UsernameNotFoundException("Not found user with username: "+username);
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (int i = 0; i < users.getUserRoleList().size(); i++) {
            authorities.add( new SimpleGrantedAuthority(users.getUserRoleList().get(i).getRoles().getName()));
        }
        return new User(users.getUsername(),
                users.getPassword(),
                true,true,true,true,
                authorities);
    }
}
