package com.group3.tofu.customer.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;

@Controller
public class CustomerAjaxController {

	@Autowired
	private CustomerService customerService;

	// 透過路徑參數查找account是否存在
	@ResponseBody
	@GetMapping("/account/find/{account}")
	public boolean checkAccountExist(@PathVariable(name = "account") String account) {
		if (customerService.checkAccountExist(account)) {
			return true;
		}

		return false;
	}

	// 檢查enabled的狀態
	@ResponseBody
	@GetMapping("/isEnabled/find/")
	public boolean isEnabled(@RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password) {
		return customerService.isEnabled(email, password);
	}
	
	
}
