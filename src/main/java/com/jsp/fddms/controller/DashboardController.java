package com.jsp.fddms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/donor_dashboard")
    public String donorDashboard() {
        return "donor_dashboard";
    }

    @GetMapping("/ngo_dashboard")
    public String ngoDashboard() {
        return "ngo_dashboard";
    }
}
