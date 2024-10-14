@RequestMapping(value = "/contact", method = RequestMethod.POST)
public String submitContactDetails(@RequestParam("name") String name, 
                                   @RequestParam("email") String email, 
                                   @RequestParam("phone") String phone, 
                                   @RequestParam("message") String message, 
                                   Model model) {
    try {
        // Process the contact details (e.g., log or send email)
        System.out.println("Received contact from: " + name);

        // Add the user name to the model for display on the success page
        model.addAttribute("name", name);

        // Redirect to the success page using PRG pattern
        return "redirect:/services/contactSuccess";
    } catch (Exception e) {
        // Log the error and display the error page with a message
        model.addAttribute("errorMessage", "We couldn't process your submission. Please try again later.");
        return "contact";  // Reloads contact.jsp with an error message
    }
}



