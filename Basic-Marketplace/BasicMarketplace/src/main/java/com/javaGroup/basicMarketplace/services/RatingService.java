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
		
		return ratingRepo.save(newRating);
	}
	
	public double avgRating(Long id) {
		List <Rating> ratings = ratingRepo.findByProduct(id);
		int sum = 0;
		for (Rating rating : ratings) {
			sum += rating.getRating();
		}
		if(ratings.size()==0) {
			return 0;
		}
		double avg = sum/ratings.size();
		return avg;
		//return ratings.stream().mapToDouble(val -> val).average().orElse(0.0);
	}

}
