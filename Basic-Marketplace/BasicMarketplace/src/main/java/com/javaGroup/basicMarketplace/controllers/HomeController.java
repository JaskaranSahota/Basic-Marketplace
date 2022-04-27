package com.javaGroup.basicMarketplace.controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.javaGroup.basicMarketplace.models.Cart;
import com.javaGroup.basicMarketplace.models.LoginUser;
import com.javaGroup.basicMarketplace.models.Product;
import com.javaGroup.basicMarketplace.models.Rating;
import com.javaGroup.basicMarketplace.models.User;
import com.javaGroup.basicMarketplace.services.CartService;
import com.javaGroup.basicMarketplace.services.ProductService;
import com.javaGroup.basicMarketplace.services.RatingService;
import com.javaGroup.basicMarketplace.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private ProductService productServ;
	
	@Autowired
	private RatingService ratingServ;
	
	@Autowired
	private CartService cartServ;
	
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
        session.setAttribute("userCart", cartServ.getUserCart(newUser.getId()));
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
        session.setAttribute("userCart", cartServ.getUserCart(loggedInUser.getId()));
        return "redirect:/dashboard";
    }
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session,
			Model model) {
		if(session.getAttribute("loggedInUser")!=null) {
			model.addAttribute("products", productServ.allProducts());
			// Cart userCart = (Cart) session.getAttribute("userCart");
			// model.addAttribute("cartProducts", userCart.getProductsInCart());
			ArrayList<Double> ratings = new ArrayList<Double>();
			for(Product product : productServ.allProducts()) {
				Double prodRating = ratingServ.avgRating(product.getId());
				ratings.add(prodRating);
			}
			model.addAttribute("ratings", ratings);
			User user = (User)session.getAttribute("loggedInUser");
			Long userId = user.getId();
			Cart userCart = cartServ.getUserCart(userId);
			model.addAttribute("cartProducts", userCart.getProductsInCart());
			return "dashboard.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/products/new")
	public String newProduct(HttpSession session,
			@ModelAttribute("newProduct") Product newProduct,
			BindingResult result,
			Model model) {
		if(session.getAttribute("loggedInUser")!=null) {
			
			return "new.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/products/create")
	public String create(HttpSession session,
			@Valid @ModelAttribute("newProduct") Product newProduct,
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "new.jsp";
		}
		productServ.create(newProduct, result);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/products/{id}/details")
	public String details(@PathVariable Long id,
			HttpSession session,
			Model model) {
		if(session.getAttribute("loggedInUser")!=null) {
			model.addAttribute("products", productServ.findById(id));
			model.addAttribute("prodRating", ratingServ.avgRating(id));
			return "details.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/products/{id}/addToCart")
	public String addToCart(@PathVariable Long id,
			HttpSession session,
			Model model) {
		User user = (User)session.getAttribute("loggedInUser");
		cartServ.addToCart(user.getId(), productServ.findById(id));
		return "redirect:/dashboard";
	}
	
	@GetMapping("/products/{id}/edit")
	public String edit(@PathVariable Long id,
			@ModelAttribute("updateProduct") Product updateProduct,
			HttpSession session,
			Model model) {
		if(session.getAttribute("loggedInUser")!=null) {
			model.addAttribute("product", productServ.findById(id));
			return "edit.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PutMapping("/products/{id}/update")
	public String update(@PathVariable Long id,
			@Valid @ModelAttribute("updateProduct") Product updateProduct,
			BindingResult result,
			HttpSession session,
			Model model) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		productServ.update(updateProduct, result);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/products/{id}/rating")
	public String rating(@PathVariable Long id,
			@ModelAttribute("newRating") Rating newRating,
			HttpSession session,
			Model model) {
		if(session.getAttribute("loggedInUser")!=null) {
			model.addAttribute("product", productServ.findById(id));
			return "rating.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/products/{id}/rate")
	public String rate(@PathVariable Long id,
			@Valid @ModelAttribute("newRating") Rating newRating,
			BindingResult result,
			HttpSession session,
			Model model) {
		if(result.hasErrors()) {
			return "rating.jsp";
		}
		model.addAttribute("product", productServ.findById(id));
		ratingServ.create(newRating, result);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }

}
