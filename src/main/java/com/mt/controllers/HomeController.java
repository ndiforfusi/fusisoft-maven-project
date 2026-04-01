package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // Root landing page
    @GetMapping({ "/", "/home" })
    public String home() {
        return "home"; // /WEB-INF/jsps/home.jsp
    }

    // Legacy support (old links/bookmarks)
    @GetMapping("/services/home")
    public String legacyHome() {
        return "redirect:/";
    }
}
