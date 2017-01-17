package com.library.model;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Created by vural on 04-Dec-16.
 */
public class User {

    private int userId;
    @Valid
    @NotNull
    @Size(min=2, max=30)
    private String firstname;
    @Valid
    @NotNull
    @Size(min=2, max=30)
    private String lastname;
    @Valid
    @NotNull
    @Size(min=2, max=30)
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
    private String mail;
    @Valid
    @NotNull
    @Size(min=2, max=30)
    private String password;
    private int status;

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }


    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", mail='" + mail + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                '}';
    }
}
