package com.group3.tofu.product.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;
import com.group3.tofu.product.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService ;
	
	@Autowired
	private ProductDao productDAO;
	
	@GetMapping("/product/all")
	public String findAllProduct(Model model) {

		List<Product> productList = pService.findAllProduct();

		model.addAttribute("productList", productList);

		return "product/allProduct";
	}
	
	@GetMapping("/product/findProduct")
	public Product findProductById(@RequestParam("productId") Integer productId) {
		Optional<Product> op = productDAO.findById(productId) ;
		
		if(op.isPresent()) {
			return op.get();
		}
		
		return null;
	}
	
	
}
