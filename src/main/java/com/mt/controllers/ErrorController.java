package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping({ "/error", "/services/error" })
    public String errorPage() {
        // Resolves to /WEB-INF/jsps/error.jsp
        return "error";
    }
}
