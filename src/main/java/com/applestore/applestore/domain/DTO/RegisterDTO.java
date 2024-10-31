package com.applestore.applestore.domain.DTO;

import com.applestore.applestore.service.Validator.RegisterChecked;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {

    @NotNull
    @Email(message = "", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    @NotEmpty(message = "Email cannot be empty")
    private String email;
    @NotNull
    @NotBlank(message = "First Name cannot be empty")
    private String firstName;
    @NotNull
    @NotBlank(message = "Last Name cannot be empty")
    private String lastName;
    @NotNull
    @Size(min = 4, message = "Password min 4 characters")
    private String password;
    @NotNull
    @NotBlank(message = "Confirm Password cannot be empty")
    private String confirmPassword;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
