package org.generationitaly.casanova.persistence.entity;

import java.time.LocalDateTime;

import org.generationitaly.casanova.enums.Role;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/*
 * This class maps the database table that stores users data.
 * It is used to fetch listing by user and handle authentication
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long user_id;
    @Column(name = "username")
    private String username;
    @Column(name = "password_hash")
    private String pwd_hash;
    @Column(name = "email")
    private String email;
    @Column(name = "first_name")
    private String first_name;
    @Column(name = "last_name")
    private String last_name;
    @Column(name = "phone")
    private String phone;
    @Enumerated(EnumType.STRING)
    @Column(name = "role")
    private Role role;
    @Column(name = "created_at")
    private LocalDateTime createdAt;


    public User() {

    }

    public User(String username, String pwd_hash, String email, String first_name, String last_name, String phone,
            Role role) {
        this.username = username;
        this.pwd_hash = pwd_hash;
        this.email = email;
        this.first_name = first_name;
        this.last_name = last_name;
        this.phone = phone;
        this.role = role;
    }



    public long getUser_id() {
        return user_id;
    }


    public String getUsername() {
        return username;
    }


    public String getPwd_hash() {
        return pwd_hash;
    }


    public String getEmail() {
        return email;
    }


    public String getFirst_name() {
        return first_name;
    }


    public String getLast_name() {
        return last_name;
    }


    public String getPhone() {
        return phone;
    }


    public Role getRole() {
        return role;
    }


    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    


    public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public void setUsername(String username) {
        this.username = username;
    }


    public void setPwd_hash(String pwd_hash) {
        this.pwd_hash = pwd_hash;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }


    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }


    public void setPhone(String phone) {
        this.phone = phone;
    }


    public void setRole(Role role) {
        this.role = role;
    }


    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "User [username=" + username + ", pwd_hash=" + pwd_hash + ", email=" + email + ", first_name="
                + first_name + ", last_name=" + last_name + ", phone=" + phone + ", role=" + role + "]";
    }

    
    
}