package com.javaGroup.basicMarketplace.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Range;

@Entity
@Table(name="ratings")
public class Rating {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Range(min=0, max=5, message="Minimum: 0/ Maximum: 5")
	private int rating;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User ratedBy;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="product_id")
	private Product ratedProduct;
	
	public Rating() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public User getRatedBy() {
		return ratedBy;
	}

	public void setRatedBy(User ratedBy) {
		this.ratedBy = ratedBy;
	}

	public Product getRatedProduct() {
		return ratedProduct;
	}

	public void setRatedProduct(Product ratedProduct) {
		this.ratedProduct = ratedProduct;
	}
	
	
}
