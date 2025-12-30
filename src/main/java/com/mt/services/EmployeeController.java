package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @PostMapping("/save")
    public String saveEmployeeDetails(
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam(required = false) String website,
            @RequestParam(required = false) String dob,
            @RequestParam(required = false) String hobbies,
            @RequestParam(required = false) String birthPlace,
            @RequestParam(required = false) String favoritePlaces,
            HttpSession session) {

        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
        session.setAttribute("website", website);
        session.setAttribute("dob", dob);
        session.setAttribute("hobbies", hobbies);
        session.setAttribute("birthPlace", birthPlace);
        session.setAttribute("favoritePlaces", favoritePlaces);

        // PRG pattern prevents form resubmission on refresh
        return "redirect:/employee/details";
    }

    @GetMapping("/details")
    public String employeeDetails() {
        return "employeeDetails"; // /WEB-INF/jsps/employeeDetails.jsp
    }
}
