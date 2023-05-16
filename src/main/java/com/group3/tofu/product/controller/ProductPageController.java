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
	
	//跳轉到BMW頁面
	@GetMapping("product/bmwDetail")
	public String productDetail() {
					
		return "product/bmwDetail";
				
	}
	
	//測試頁面
	@GetMapping("product/test1")
	public String test() {
						
		return "product/test";
					
	}
	
	//測試頁面
		@GetMapping("product/test2")
		public String test2() {
							
			return "product/test2";
						
		}

}
