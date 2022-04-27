package com.javaGroup.basicMarketplace.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaGroup.basicMarketplace.models.Product;
import com.javaGroup.basicMarketplace.repositories.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepo;
	
	public List<Product> allProducts(){
		return productRepo.findAll();
	}
	
	public Product create(Product newProduct, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		productRepo.save(newProduct);
		return null;
	}
	
	public Product findById(Long id) {
		return productRepo.findById(id).orElse(null);
	}
	
	public Product update(Product updateProduct, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		return productRepo.save(updateProduct);
	}

}
