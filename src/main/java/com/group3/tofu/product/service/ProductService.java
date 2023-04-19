package com.group3.tofu.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;



@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDAO;
	
	public Page<Product> getProductByPage(Integer page, Integer count) {

		Page<Product> pageProduct = productDAO.findAll(PageRequest.of(page - 1, count));

		return pageProduct;
	}
	
}
