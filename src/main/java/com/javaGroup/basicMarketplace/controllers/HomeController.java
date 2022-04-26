package com.javaGroup.basicMarketplace.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.javaGroup.basicMarketplace.models.LoginUser;
import com.javaGroup.basicMarketplace.models.User;
import com.javaGroup.basicMarketplace.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userServ;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, 
            Model model, 
            HttpSession session) {
        
        // Validations and create a new user!
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
        }
        
        // No errors! 
        userServ.register(newUser, result);
        // Log them in.
        session.setAttribute("loggedInUser", newUser);
        return "redirect:/dashboard";
    }
    
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
            BindingResult result, 
            Model model, 
            HttpSession session) {
        
		// Check for errors on the login
    	User loggedInUser = userServ.login(newLogin, result);
        if(result.hasErrors()) {
        	model.addAttribute("newUser", new User());
            return "login.jsp";
        }
    
        // No errors! 
        
        // Log them in.
        session.setAttribute("loggedInUser", loggedInUser);
        return "redirect:/dashboard";
    }
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
		if(session.getAttribute("loggedInUser")!=null) {
			return "dashboard.jsp";
		}
		else {
			return "redirect:/";
		}
	}

}
