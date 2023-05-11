package com.group3.tofu.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	// 回首頁
	@GetMapping("/")
	public String home() {

		return "index";
	}

	// 跳轉到關於我們 -> 成員介紹
	@GetMapping("/about")
	public String about() {

		return "about";
	}

	// 跳轉到關於我們 -> 公司簡介
	@GetMapping("/company")
	public String company() {

		return "company";
	}

	// 跳轉到登入
	@GetMapping("customer/login")
	public String login() {

		return "customer/login";
	}



	// 跳轉到註冊
	@GetMapping("customer/register")
	public String register() {

		return "customer/register";
	}

	// 跳轉到請驗證的頁面(check Enabled)
	@GetMapping("customer/checkEnabled")
	public String checkEnabled() {

		return "customer/checkEnabled";
	}

	// 跳轉到會員中心的頁面
	@GetMapping("customer/customerCenter")
	public String customerCenter() {

		return "customer/customerCenter";
	}
	
	// 跳轉到修改會員-個人資料的頁面
	@GetMapping("customer/updateProfile")
	public String updateProfile() {

		return "customer/updateProfile";
	}
	
	//跳轉到管理者後台的頁面
	@GetMapping("mgm/Management")
	public String management() {
		
		return "mgm/Management" ;
	}
	
	//挑轉進去管理者dashboard畫面
	@GetMapping("mgm/Dashboard")
	public String Dashboard() {
		
		return "mgm/Dashboard" ;
	}
	
//	//跳轉customerManagement頁面
//	@GetMapping(path="mgm/customerManagement")
//	public String customerManagement() {
//		
//		return "mgm/customerManagement" ;
//	}
	
	

}
