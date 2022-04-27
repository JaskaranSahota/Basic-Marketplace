package com.javaGroup.basicMarketplace.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaGroup.basicMarketplace.models.Cart;

@Repository
public interface CartRepository extends CrudRepository<Cart, Long> {
	
	@Query(value="SELECT * FROM carts WHERE user_id=?1", nativeQuery=true)
	Cart findByUser(Long id);

}

