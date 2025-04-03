package org.generationitaly.casanova.persistence.entity;

import java.time.LocalDateTime;

import org.generationitaly.casanova.enums.Role;
import org.generationitaly.casanova.enums.RoleStatus;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Applications")
public class RoleApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long app_id;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @Column(name = "requested_role")
    @Enumerated(EnumType.STRING)
    private Role requested_role;
    @Column(name = "request_status")
    @Enumerated(EnumType.STRING)
    private RoleStatus request_status;
    @Column(name = "last_modified")
    private LocalDateTime last_modified;
    @Column(name = "created_at")
    private LocalDateTime created_at;
    @Column(name = "message")
    private String message;
    public RoleApplication() {}

    public long getApp_id() {
        return app_id;
    }

    public User getUser() {
        return user;
    }

    public Role getRequested_role() {
        return requested_role;
    }

    public RoleStatus getRequest_status() {
        return request_status;
    }

    public LocalDateTime getLast_modified() {
        return last_modified;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setRequested_role(Role requested_role) {
        this.requested_role = requested_role;
    }

    public void setRequest_status(RoleStatus request_status) {
        this.request_status = request_status;
    }

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

    
    
}
