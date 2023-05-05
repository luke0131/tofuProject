package com.group3.tofu.gift.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group3.tofu.gift.model.bean.ShoppingCart;

public interface ShoppingCartDAO extends JpaRepository<ShoppingCart, Integer> {
	
	@Query(value = "from ShoppingCart where f_cID = ?1")
	List<ShoppingCart> findByCustomerId(Integer cID);
	
	

}
