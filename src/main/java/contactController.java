package com.mt.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contact")
public class ContactController {

    @PostMapping("/submitContact")
    public String submitContact(HttpServletRequest request, HttpSession session) {
        // Retrieve form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String project = request.getParameter("project");

        // Here you would typically save the data to a database
        // For demonstration, we're storing it in the session
        session.setAttribute("contactName", name);
        session.setAttribute("contactPhone", phone);
        session.setAttribute("contactEmail", email);
        session.setAttribute("contactProject", project);

        // Redirect to confirmation page
        return "contactConfirmation";
    }
}
