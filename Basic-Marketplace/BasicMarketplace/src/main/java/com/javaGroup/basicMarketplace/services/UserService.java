package com.javaGroup.basicMarketplace.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaGroup.basicMarketplace.models.LoginUser;
import com.javaGroup.basicMarketplace.models.User;
import com.javaGroup.basicMarketplace.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
		// Check if email is already used
		if(userRepo.findByEmail(newUser.getEmail())!=null) {
			result.rejectValue("email", "unique", "This email is already in use!");
		}
		// Check if password matches
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "Mismatch", "Password does not match!");
		}
		// Check for other errors and validations
		if(result.hasErrors()) {
			return null;
		}
		// If newUser passes all the above validations then continue to hash password and register
		String hashed= BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		userRepo.save(newUser);
		return null;
		
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		// Find User by email, reject if not present
		User user = userRepo.findByEmail(newLogin.getEmail());
		if(user==null) {
			result.rejectValue("email", "missingEmail", "Email not found!");
			return null;
		}
		// Check password
		else {
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				result.rejectValue("password", "Matches", "Invalid Password");
			}
		}
		// if email and password match return the user
		return user;
	}

}
