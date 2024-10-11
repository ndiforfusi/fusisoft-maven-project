package com.mt.services;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/employee")
public class EmployeeService {

    @GetMapping("/getEmployeeDetails")
    @ResponseBody
    public ResponseEntity<String> getEmployeeDetails(HttpSession session) {
        try {
            JSONObject js = new JSONObject();
            js.put("firstName", "Ndifor");
            js.put("lastName", "Fusi");
            js.put("website", "tech.fusisoft.com");
            js.put("dob", "May 1, 1975");
            js.put("hobbies", "Praying, Singing, Reading Technical Blogs, Teaching, Helping the Poor");
            js.put("bornIn", "Africa, Cameroon, Bali");
            js.put("placesHeLikes", "Africa, NA, Bali");

            // Return a proper ResponseEntity with the JSON data and a status of OK
            return new ResponseEntity<>(js.toString(), HttpStatus.OK);

        } catch (JSONException e) {
            // Handle the exception and return a proper error message
            return new ResponseEntity<>("Error creating employee details", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
