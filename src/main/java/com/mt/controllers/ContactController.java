package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ContactController {

    // Logger instance for better log management
    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

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
                                       @RequestParam("message") String message, 
                                       Model model) {
        // Log the contact submission
        logger.info("Received contact from: {} with email: {} and phone: {}", name, email, phone);

        // Simulate processing logic (e.g., sending an email)
        try {
            // Placeholder: Replace with real email sending logic or database save
            logger.debug("Processing contact request for: {}", name);
            // Example: sendEmailToAdmin(name, email, phone, message);
        } catch (Exception e) {
            logger.error("Error processing contact submission for: {}", name, e);
            model.addAttribute("errorMessage", "There was an error processing your request. Please try again.");
            return "contact";  // Reload the form with an error message
        }

        // Store confirmation message in the model (for success page)
        model.addAttribute("name", name);

        // Redirect to avoid duplicate form submissions on page refresh (PRG pattern)
        return "redirect:/services/contactSuccess";
    }

    // Optional: Handle contact success page display
    @RequestMapping(value = "/contactSuccess", method = RequestMethod.GET)
    public String showSuccessPage() {
        return "contactSuccess";  // Renders contactSuccess.jsp
    }
}


