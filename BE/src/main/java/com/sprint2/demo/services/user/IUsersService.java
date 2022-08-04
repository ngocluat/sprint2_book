package com.sprint2.demo.services.user;



import com.sprint2.demo.dto.user.payload.SignUpRequest;
import com.sprint2.demo.models.Users;

import java.util.List;

public interface IUsersService {


    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     *
     */
    void saveUsers(SignUpRequest signUpRequest);

    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     *
     */
    void saveUser(Users users);

    List<Users> checkEmail(String email);
}
