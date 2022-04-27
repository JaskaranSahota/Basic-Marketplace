package com.javaGroup.basicMarketplace.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaGroup.basicMarketplace.models.Cart;
import com.javaGroup.basicMarketplace.models.Product;
import com.javaGroup.basicMarketplace.repositories.CartRepository;

@Service
public class CartService {
	
	@Autowired
	private CartRepository cartRepo;
	
	public Cart getUserCart(Long id) {
		return cartRepo.findByUser(id);
	}
	
	public Cart create(Cart newCart) {
		return cartRepo.save(newCart);
	}
	
	public Cart addToCart(Long id, Product product) {
		Cart userCart = cartRepo.findByUser(id);
		userCart.getProductsInCart().add(product);
		cartRepo.save(userCart);
		return userCart;
	}

}
