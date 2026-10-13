package com.jsp.fddms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ErrorController {

    @GetMapping("/access-denied")
    public String accessDenied(
            HttpServletRequest request, Model model) {

        model.addAttribute(
            "message",
            request.getAttribute("errorMessage") != null
                ? request.getAttribute("errorMessage")
                : "You don't have permission to access this page."
        );

        return "access_denied";
    }
}