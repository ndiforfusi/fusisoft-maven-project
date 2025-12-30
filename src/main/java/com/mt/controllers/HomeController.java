package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // Landing page: http://host:8080/myapps/
    @GetMapping("/")
    public String root() {
        return "home";
    }

    // Optional: http://host:8080/myapps/home
    @GetMapping("/home")
    public String home() {
        return "home";
    }
}
