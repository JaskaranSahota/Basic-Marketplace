package com.javaGroup.basicMarketplace.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaGroup.basicMarketplace.models.Rating;
import com.javaGroup.basicMarketplace.repositories.RatingRepository;

@Service
public class RatingService {
	
	@Autowired
	private RatingRepository ratingRepo;
	
	public List<Rating> allRatings(){
		return ratingRepo.findAll();
	}
	
	public Rating create(Rating newRating, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		ratingRepo.save(newRating);
		return null;
	}

}
