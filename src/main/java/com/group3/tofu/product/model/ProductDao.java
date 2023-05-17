package com.group3.tofu.product.model;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ProductDao extends JpaRepository<Product, Integer> {
	
	@Query("from Product where product_model = :product_model")
	public Product findByProductModel(@Param("product_model") String productModel) ;
	
}
