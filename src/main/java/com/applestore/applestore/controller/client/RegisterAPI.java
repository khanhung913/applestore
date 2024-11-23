package com.applestore.applestore.controller.client;

import java.util.Calendar;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.applestore.applestore.domain.User;
import com.applestore.applestore.email.EmailService;
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
    private EmailService emailService;

    public RegisterAPI(UserService userService, EmailService emailService) {
        this.userService = userService;
        this.emailService = emailService;
    }

    @PostMapping("/api/confirm-register")
    public ResponseEntity<Boolean> confirmRegisterAPI(
            @RequestBody() RegisterForm registerForm) {
        User user = this.userService.handleFindByEmail(registerForm.getEmail());
        if (registerForm.getToken().equals(user.getToken())
                && Calendar.getInstance().getTimeInMillis() - user.getTimesendtoken() <= 60000) {
            user.setEnable(true);
            user.setToken(UUID.randomUUID().toString());
            this.userService.handleSaveUser(user);
            return ResponseEntity.ok().body(true);
        } else if (!registerForm.getToken().equals(user.getToken())) {
            return ResponseEntity.ok().body(false);
        }
        return ResponseEntity.ok().body(false);
    }

    @PostMapping("/api/resendcode")
    public void resendcodeAPI(
            @RequestBody() RegisterForm registerForm) {
        User user = this.userService.handleFindByEmail(registerForm.getEmail());
        user.setTimesendtoken(Calendar.getInstance().getTimeInMillis());
        user.setToken(this.userService.handleGenerateToken());
        // this.emailService.sendEmail(registerForm.getEmail(), user.getToken());
        this.userService.handleSaveUser(user);
    }

    @PostMapping("/api/checkExistEmailResetPassword")
    public ResponseEntity<Boolean> checkExistEmailResetPassword(
            @RequestBody() RegisterForm registerForm) {
        User user = this.userService.handleFindByEmail(registerForm.getEmail());
        if (user != null) {
            return ResponseEntity.ok().body(true);
        } else {
            return ResponseEntity.ok().body(false);
        }
    }

    @PostMapping("/api/sendCodeResetPassword")
    public void sendCodeResetPassword(
            @RequestBody() RegisterForm registerForm) {
        User user = this.userService.handleFindByEmail(registerForm.getEmail());
        user.setTimesendtoken(Calendar.getInstance().getTimeInMillis());
        user.setToken(this.userService.handleGenerateToken());
        // this.emailService.sendEmail(registerForm.getEmail(), user.getToken());
        this.userService.handleSaveUser(user);
    }
}
