package com.group3.tofu.photo.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group3.tofu.product.model.Product;

public interface PhotoDao extends JpaRepository<Product, Integer>{
	
	public Photo findById(Integer photoId,byte[] photo);

	public void save(Photo p);
	
}
