package com.group3.tofu.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductPageController {
	
	//跳轉到所有商品頁面
	@GetMapping("product/allProduct")
	public String allProduct() {
		
		return "product/allProduct";
	
	}
	
	//跳轉到買車頁面
	@GetMapping("product/buyCar")
	public String buyCar() {
			
		return "product/buyCar";
		
	}
	
	//跳轉到詳細商品頁面
		@GetMapping("product/productDetail")
		public String productDetail() {
				
			return "product/productDetail";
			
		}

}
