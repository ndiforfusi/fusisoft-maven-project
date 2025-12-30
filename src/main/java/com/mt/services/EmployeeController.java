package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
            Model model) {

        // Add data to the model (request scope)
        model.addAttribute("firstName", firstName);
        model.addAttribute("lastName", lastName);
        model.addAttribute("website", website);
        model.addAttribute("dob", dob);
        model.addAttribute("hobbies", hobbies);
        model.addAttribute("birthPlace", birthPlace);
        model.addAttribute("favoritePlaces", favoritePlaces);

        // Resolves to /WEB-INF/jsps/employeeDetails.jsp
        return "employeeDetails";
    }
}
