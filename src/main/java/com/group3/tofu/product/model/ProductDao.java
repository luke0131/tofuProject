package com.group3.tofu.product.model;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface ProductDao extends JpaRepository<Product, Integer> {
	
	@Query("from Product where product_model = :product_model")
	public Product findByProductModel(@Param("product_model") String productModel) ;
	
	// 模糊搜尋商品名稱
	@Query(value = "select * from Product where productModel like %:name%", nativeQuery = true)
	Page<Product> findByProductNameLike(@Param("name") String keyword, Pageable pageble);
	
}
