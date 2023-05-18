package com.group3.tofu.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductPageController {
	
	//跳轉到買車頁面
	@PostMapping("product/pSelect")
	public String selectCar() {
				
		return "product/productSelect";
			
	}
	
	//跳轉到買車頁面
	@GetMapping("product/buyCar")
	public String buyCar() {
			
		return "product/buyCar";
		
	}
	
	//跳轉到Toyota頁面
	@GetMapping("product/toyotaDetail")
	public String toyotaDetail() {
				
		return "product/toyotaDetail";
			
	}
	
	//跳轉到Honda頁面
	@GetMapping("product/hondaDetail")
	public String hondaDetail() {
					
		return "product/hondaDetail";
				
	}
	
	//跳轉到Benz頁面
	@GetMapping("product/benzDetail")
	public String benzDetail() {
						
		return "product/benzDetail";
					
	}
	
	//跳轉到BMW頁面
	@GetMapping("product/bmwDetail")
	public String productDetail() {
					
		return "product/bmwDetail";
				
	}

}
