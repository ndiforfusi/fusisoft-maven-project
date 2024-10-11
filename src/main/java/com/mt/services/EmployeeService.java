package com.mt.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/employee")
public class EmployeeService {

    @RequestMapping(value = "/saveEmployeeDetails", method = RequestMethod.POST)
    public String saveEmployeeDetails(HttpServletRequest request, HttpSession session) {
        // Capture form data from the request
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String website = request.getParameter("website");
        String dob = request.getParameter("dob");
        String hobbies = request.getParameter("hobbies");
        String birthPlace = request.getParameter("birthPlace");
        String favoritePlaces = request.getParameter("favoritePlaces");

        // Store the data in session
        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
        session.setAttribute("website", website);
        session.setAttribute("dob", dob);
        session.setAttribute("hobbies", hobbies);
        session.setAttribute("birthPlace", birthPlace);
        session.setAttribute("favoritePlaces", favoritePlaces);

        // Redirect to the employeeDetails.jsp to display the data
        return "employeeDetails";
    }
}

