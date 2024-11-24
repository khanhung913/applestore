package com.applestore.applestore.domain.DTO;

import com.applestore.applestore.service.Validator.ResetPassChecked;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@ResetPassChecked
public class ResetPassDTO {
    // @NotNull
    // @Email(message = "", regexp =
    // "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    // @NotEmpty(message = "Email cannot be empty")
    private String token;
    @Size(min = 4, message = "最低４文字")
    private String password;
    @NotNull
    @NotBlank(message = "入力してください。")
    private String confirmPassword;

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

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}
