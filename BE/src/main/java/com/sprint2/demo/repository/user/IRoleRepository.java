package com.sprint2.demo.repository.user;

import com.sprint2.demo.models.Roles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IRoleRepository extends JpaRepository<Roles,Integer> {
    Roles findAllByName(String name);
    /**
     *
     * HuuNQ Created
     * Time : 01/07/2022 16:00
     * This method get Role from database
     */
    @Query(value="select * from roles where name = :roleName",nativeQuery=true)
    Roles findRolesByRoleName(@Param("roleName") String string);
}
