package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ContactController {

    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

    // Display the contact form
    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String showContactForm() {
        return "contact";  // Maps to contact.jsp in /WEB-INF/jsps/
    }

    // Handle form submission
    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String submitContactDetails(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("message") String message,
            Model model) {
        try {
            logger.info("Received contact from: {} with email: {} and phone: {}", name, email, phone);

            model.addAttribute("name", name);

            // Redirect to success page
            return "redirect:/services/contactSuccess";
        } catch (Exception e) {
            logger.error("Error processing contact submission for: {}", name, e);

            model.addAttribute("errorMessage", "We couldn't process your submission. Please try again.");
            return "contact";  // Reload contact.jsp with an error message
        }
    }
}

