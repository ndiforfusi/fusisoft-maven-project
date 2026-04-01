package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Simple page routing controller:
 * view names map to /WEB-INF/jsps/<view>.jsp (via InternalResourceViewResolver)
 */
@Controller
public class ServicesController {

    @GetMapping("/devops")
    public String devops() { return "devops-consulting"; }

    @GetMapping("/sre")
    public String sre() { return "sre"; }

    @GetMapping("/devsecops")
    public String devsecops() { return "devsecops"; }

    @GetMapping("/iac")
    public String iac() { return "iac"; }

    @GetMapping("/cybersecurity")
    public String cybersecurity() { return "cybersecurity"; } // create JSP if needed
}
