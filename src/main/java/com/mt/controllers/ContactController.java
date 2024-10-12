package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactController {

    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String submitContactDetails(@RequestParam("name") String name, 
                                       @RequestParam("email") String email, 
                                       @RequestParam("phone") String phone, 
                                       @RequestParam("message") String message) {
        // Process and handle the contact information
        // This data can be sent via email to fusisoft@gmail.com
        return "contactSuccess";
    }
}

