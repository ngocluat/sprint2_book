package com.sprint2.demo.models;

import javax.persistence.*;

@Entity
public class UserRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "username", referencedColumnName = "username")
    private Users users;
    @ManyToOne
    @JoinColumn(name = "role", referencedColumnName = "id")
    private Roles roles;

    public UserRole() {
    }

    public UserRole(Users users, Roles roles) {
        this.users = users;
        this.roles = roles;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }
}
