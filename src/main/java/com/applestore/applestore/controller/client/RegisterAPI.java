package com.applestore.applestore.controller.client;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.applestore.applestore.domain.User;
import com.applestore.applestore.service.UserService;

class RegisterForm {
    private String token;
    private String email;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}

@RestController
public class RegisterAPI {
    private UserService userService;

    public RegisterAPI(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/api/confirm-register")
    public ResponseEntity<Boolean> confirmRegisterAPI(
            @RequestBody() RegisterForm registerForm) {
        User user = this.userService.handleFindByEmail(registerForm.getEmail());
        if (registerForm.getToken().equals(user.getToken())) {
            user.setEnable(true);
            user.setToken(this.userService.handleGenerateToken());
            this.userService.handleSaveUser(user);
            return ResponseEntity.ok().body(true);
        } else if (!registerForm.getToken().equals(user.getToken())) {
            return ResponseEntity.ok().body(false);
        }
        return ResponseEntity.ok().body(false);
    }
}
