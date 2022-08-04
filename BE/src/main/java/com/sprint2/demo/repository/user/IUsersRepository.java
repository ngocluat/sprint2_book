package com.sprint2.demo.repository.user;


import com.sprint2.demo.dto.user.IUsersDto;
import com.sprint2.demo.models.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IUsersRepository extends JpaRepository<Users,String> {

    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function: use to check username and password when someone use login
     */
    @Query(value="SELECT username,password,flag FROM Users where username = :username and password = :password",nativeQuery=true)
    @Transactional
    @Modifying
    IUsersDto getUsersByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function: use to check email exists in table users
     */
    @Query(value="select * from users u where exists (select * from users where u.username = :email)",nativeQuery=true)
    List<Users> checkEmail(@Param("email") String email);

    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function: use to save users
     */
    @Query(value="insert into users(username,password,flag) values (:username,:password,:flag)", nativeQuery=true)
    @Transactional
    @Modifying
    void saveUser(@Param("username") String username, @Param("password") String password, @Param("flag") boolean flag);
    /**
     * Created by HuuNQ
     * Time 12:00 30/06/2022
     * Function: use to get User by username
     */
    @Query("SELECT u FROM Users u WHERE u.username = :username")
    Users getUserByUsername(@Param("username") String username);

    Users findByUsername(String username);
}
