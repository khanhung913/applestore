package com.applestore.applestore.email;

public interface EmailSender {

    void sendEmail(String to, String subject, String email);
}
