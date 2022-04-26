package com.javaGroup.basicMarketplace.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaGroup.basicMarketplace.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
	
	List<Rating> findAll();
	
	Rating findByRatedProduct(Long id);

}
