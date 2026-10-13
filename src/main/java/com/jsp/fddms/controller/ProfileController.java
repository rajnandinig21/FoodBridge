package com.jsp.fddms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jsp.fddms.entity.User;
import com.jsp.fddms.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/profile")
	public String profile(HttpSession session,Model model) {
		System.out.println("Profile Session ID : " + session.getId());
		User user = (User)session.getAttribute("user");
		System.out.println(user);
		model.addAttribute("user", user);
		return "profile";
	}
	
	@GetMapping("/edit_profile")
	public String editProfile(HttpSession session, Model model) {

	    User user = (User) session.getAttribute("user");

	    model.addAttribute("user", user);

	    return "edit_profile";
	}
	
	@PostMapping("/update_profile")
	public String updateProfile(@ModelAttribute User user,HttpSession session) {
		
		User updatedUser = userService.updateProfile(user);
		session.setAttribute("user", updatedUser);
		return "redirect:/profile";
	}

}

