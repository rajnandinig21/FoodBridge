package com.jsp.fddms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.fddms.entity.User;
import com.jsp.fddms.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	

    @GetMapping("/login")
    public String loginPage(
            @RequestParam(
                value = "error", required = false) String error,
            Model model) {

        if (error != null) {
            model.addAttribute("message", "Invalid email or password");
        }

        return "login";
    }

//    @GetMapping("/login_success")
//    public String loginSuccess(
//            Authentication authentication,
//            HttpSession session) {
//
//        User user = userService.findByEmail(
//            authentication.getName()
//        );
//
//        if (user == null) {
//            return "redirect:/login?error=true";
//        }
//
//        session.setAttribute("user", user);
//
//        if ("DONOR".equalsIgnoreCase(user.getRole())) {
//            return "redirect:/donor_dashboard";
//        }
//
//        if ("NGO".equalsIgnoreCase(user.getRole())) {
//            return "redirect:/ngo_dashboard";
//        }
//
//        return "redirect:/login?error=true";
//    }
    

@GetMapping("/login_success")
public String loginSuccess(
        Authentication authentication,
        HttpSession session) {

    if (authentication == null ||
        !authentication.isAuthenticated()) {
        return "redirect:/login?error=true";
    }

    User user = userService.findByEmail(authentication.getName());

    if (user == null) {
        System.out.println("LOGIN DEBUG: User not found in database");
        return "redirect:/login?error=true";
    }

    System.out.println("LOGIN DEBUG: Email = " + user.getEmail());
    System.out.println("LOGIN DEBUG: Role = [" + user.getRole() + "]");

    session.setAttribute("user", user);

    if ("DONOR".equalsIgnoreCase(user.getRole())) {
        return "redirect:/donor_dashboard";
    }

    if ("NGO".equalsIgnoreCase(user.getRole())) {
        return "redirect:/ngo_dashboard";
    }

    System.out.println("LOGIN DEBUG: Unexpected role");
    return "redirect:/login?error=true";
}

}
