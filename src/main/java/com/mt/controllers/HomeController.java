package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @GetMapping("/services/home")
    public ModelAndView homePage() {
        return new ModelAndView("home"); // This maps to /WEB-INF/jsps/home.jsp
    }
}

