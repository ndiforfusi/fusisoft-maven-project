package com.mt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactController {

    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

    /**
     * GET: Contact Success Page
     */
    @GetMapping("/contactSuccess")
    public String contactSuccess(Model model) {
        return "successContact";
        // Resolves to: /WEB-INF/jsps/successContact.jsp
    }

    /**
     * POST: Handle Contact Form Submission
     */
    @PostMapping("/contact")
    public String submitContactDetails(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) String message,
            Model model) {

        logger.info("Contact form submitted - Name: {}, Email: {}, Phone: {}", name, email, phone);

        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("phone", phone);
        model.addAttribute("message", message);

        return "redirect:/contactSuccess";
    }
}
