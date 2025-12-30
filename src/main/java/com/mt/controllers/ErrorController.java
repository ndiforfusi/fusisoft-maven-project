package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/services/error")
    public String error() {
        return "error"; // resolves to /WEB-INF/jsps/error.jsp
    }
}
