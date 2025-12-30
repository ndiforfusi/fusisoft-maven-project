package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/services")
public class HomeController {

    @GetMapping("/home")
    public ModelAndView homePage() {
        // Resolves to: /WEB-INF/jsps/home.jsp
        return new ModelAndView("home");
    }
}

