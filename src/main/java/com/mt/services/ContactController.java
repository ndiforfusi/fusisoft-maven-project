import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ContactController {

    // Mapping for contact success page
    @RequestMapping(value = "/contactSuccess", method = RequestMethod.GET)
    public String contactSuccess(Model model) {
        return "../jsps/successContact";  // Adjust path to match actual JSP location
    }

    // Handle POST requests to submit contact details
    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String submitContactDetails(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("message") String message,
            Model model) {
        model.addAttribute("name", name);
        return "redirect:/contactSuccess";  // Ensure it points to the GET method above
    }
}


