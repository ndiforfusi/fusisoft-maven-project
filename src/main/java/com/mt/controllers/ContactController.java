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

    // Logger instance for logging
    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

    // Handle GET requests to display the contact form
    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String showContactForm() {
        return "contact";  // Renders contact.jsp
    }

    // Handle POST requests to submit contact details
    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String submitContactDetails(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("message") String message,
            Model model) {
        try {
            // Log the submission details
            logger.info("Received contact from: {} with email: {} and phone: {}", name, email, phone);

            // Add the name to the model to pass to the success page
            model.addAttribute("name", name);

            // Redirect to the success page (PRG pattern)
            return "redirect:/services/contactSuccess";
        } catch (Exception e) {
            // Log any error
            logger.error("Error processing contact submission for: {}", name, e);

            // Add an error message to the model and reload the form
            model.addAttribute("errorMessage", "We couldn't process your submission. Please try again.");
            return "contact";  // Reloads contact.jsp with an error message
        }
    }
}




