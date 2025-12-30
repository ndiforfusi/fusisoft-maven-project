package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/error")
    public String errorPage() {
        return "error"; // /WEB-INF/jsps/error.jsp
    }
}
