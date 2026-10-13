package com.jsp.fddms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;
    
    public String generateOtp() {
    	return String.valueOf((int)(Math.random()*900000)+100000);
    }

    public void sendOtp(String toEmail,String otp){

    	System.out.println("sendOtp() called");
        SimpleMailMessage mail = new SimpleMailMessage();

        mail.setTo(toEmail);
        mail.setSubject("Food Donation Management System - Password Reset OTP");
        mail.setText("Your OTP for password reset is: "+otp+"\n\nThis OTP is valid for 5 minutes");

        mailSender.send(mail);
    }
    
    // ================= GENERAL EMAIL =================

    public void sendEmail(String toEmail, String subject, String message) {

        System.out.println("Sending email to: " + toEmail);

        SimpleMailMessage mail = new SimpleMailMessage();

        mail.setTo(toEmail);
        mail.setSubject(subject);
        mail.setText(message);

        mailSender.send(mail);
    }
}
