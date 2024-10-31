package vn.edu.hcmuaf.fit.controller.user_page.APIService;

import java.util.Random;

public class SendEmail {
    public String getRandomVerifyCode() {
        Random rd = new Random();
        int number = rd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendVerifyCode(String email, String code) {
        EmailSender emailSender = new EmailSender();
        return emailSender.sendEmail(email, "Email Verification", "Your verify code: " + code);
    }

    public boolean sendPassword(String email, String pass) {
        EmailSender emailSender = new EmailSender();
        return emailSender.sendEmail(email, "Resend password", "Your password here: " + pass);
    }
}