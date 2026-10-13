package com.jsp.fddms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.fddms.entity.User;
import com.jsp.fddms.service.EmailService;
import com.jsp.fddms.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotPasswordController {

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/forgot_password")
	public String forgotPassword() {
		return "forgot_password";
	}

	@PostMapping("/forgot_password")
	public String sendOtp(@RequestParam String email, HttpSession session, Model model) {
		User user = userService.findByEmail(email);

		if (user == null) {
			model.addAttribute("message", "Email not found");
			return "forgot_password";
		}
		String otp = emailService.generateOtp();

		emailService.sendOtp(email, otp);

		session.setAttribute("otp", otp);
		session.setAttribute("email", email);
		return "otp";

	}

	@PostMapping("/verify_otp")
	public String verifyOtp(@RequestParam String otp, HttpSession session, Model model) {
		String storedOtp = (String) session.getAttribute("otp");

		if (otp.equals(storedOtp))
			return "reset_password";

		model.addAttribute("message", "Invalid OTP");
		return "otp";
	}

	@PostMapping("/reset_password")
	public String resetPassword(@RequestParam String newPassword, @RequestParam String confirmPassword,
			HttpSession session, Model model) {

		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("message", "Password do not match");
			return "reset_password";
		}

		String email = (String) session.getAttribute("email");

		User user = userService.findByEmail(email);

		user.setPassword(passwordEncoder.encode(newPassword));
		userService.updateProfile(user);

		session.removeAttribute("otp");
		session.removeAttribute("email");

		model.addAttribute("message", "Password reset succesfull.");

		return "login";
	}

}
