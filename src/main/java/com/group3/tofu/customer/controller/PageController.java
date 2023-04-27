package com.group3.tofu.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.group3.tofu.content.model.Contact;
import com.group3.tofu.content.service.ContactService;

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

	@GetMapping("/introduce")
	public String introduce() {
		return "maintenance/introduce";
	}

	@GetMapping("/main")
	public String showNextPage() {
		return "maintenance/add";
	}

	// 跳轉到註冊
	@GetMapping("customer/register")
	public String register() {

		return "customer/register";
	}
	


}
