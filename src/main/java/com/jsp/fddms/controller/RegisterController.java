package com.jsp.fddms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jsp.fddms.entity.User;
import com.jsp.fddms.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	private UserService userService;

	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute User user, Model model) {

		String message = userService.registerUser(user);
		model.addAttribute("message", message);
		return "login";
	}
}
