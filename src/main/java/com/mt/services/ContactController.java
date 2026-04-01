package com.mt.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class ContactController {

    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

    // Show contact form
    @GetMapping({ "/contact" })
    public String contactForm() {
        return "contact"; // /WEB-INF/jsps/contact.jsp
    }

    // Legacy support (if any old page still points here)
    @GetMapping("/services/contact")
    public String legacyContact() {
        return "redirect:/contact";
    }

    // Handle contact submission
    @PostMapping("/contact")
    public String submitContact(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String message,
            HttpSession session,
            Model model) {

        logger.info("Contact submitted - Name: {}, Email: {}, Phone: {}", name, email, phone);

        // for success page
        session.setAttribute("contactName", name);

        // optional: if you want to display on a details page
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("phone", phone);
        model.addAttribute("message", message);

        return "redirect:/contactSuccess";
    }

    @GetMapping("/contactSuccess")
    public String contactSuccess() {
        return "successContact"; // /WEB-INF/jsps/successContact.jsp
    }
}
