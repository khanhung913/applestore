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
        user.setToken(UUID.randomUUID().toString());
        String html = "<!doctype html>\n" +
                "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"\n" +
                "      xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\"\n" +
                "          content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n"
                +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
                "    <title>Email</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h3><b>" + user.getFirstName() + " " + user.getLastName() + " 様</b></h3>\n" +
                "<p>いつもご利用いただき、ありがとうございます。</p>" +
                "<div>" + " " + "※" + "  " + "パスワード再設定する為、下のリンクをクリックしてください。</div>" +
                "<div>" + " " + "※" + "  " + "有効期限は６０分です。</div>" +
                "<div>" + " " + "※" + "  " + "有効期限が過ぎたら、無効となります。</div>" +
                "<p>https://wbc.tokyo/resetPassword?token=" + user.getToken() + "</p>" +
                "<p>このメールに返信されましても、お答えする事は出来ませんのでご了承願います。</p>" +
                "<p>-----------------------------------</p>" +
                "<div>(C)Apple Store - WBC</div>\n" +
                "</body>\n" +
                "</html>\n";
        this.emailService.sendEmail(registerForm.getEmail(), "【パスワード再設定の連絡】", html);
        this.userService.handleSaveUser(user);
    }
}
