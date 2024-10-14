package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactController {

    // Handle GET requests to display the contact form
    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String showContactForm() {
        return "contact";  // Renders contact.jsp
    }

    // Handle POST requests to submit contact details
    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String submitContactDetails(@RequestParam("name") String name, 
                                       @RequestParam("email") String email, 
                                       @RequestParam("phone") String phone, 
                                       @RequestParam("message") String message) {
        // Process and handle the contact information (e.g., send email)
        System.out.println("Received contact from: " + name);
        return "contactSuccess";  // Renders contactSuccess.jsp
    }
}

