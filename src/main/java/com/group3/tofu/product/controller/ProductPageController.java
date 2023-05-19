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
	
	//跳轉到Honda頁面
	@GetMapping("product/nissanDetail")
	public String nissanDetail() {
						
		return "product/nissanDetail";
					
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
	
	//跳轉到Mazda頁面
	@GetMapping("product/mazdaDetail")
	public String mazdaDetail() {
					
		return "product/mazdaDetail";
				
	}
	
	//跳轉到Lexus頁面
	@GetMapping("product/lexusDetail")
	public String lexusDetail() {
					
		return "product/lexusDetail";
				
	}
	
	//跳轉到Audi頁面
	@GetMapping("product/audiDetail")
	public String audiDetail() {
					
		return "product/audiDetail";
				
	}

	//跳轉到Audi頁面
	@GetMapping("product/update")
	public String productUpdate() {
					
		return "product/update";
				
	}
	
}
