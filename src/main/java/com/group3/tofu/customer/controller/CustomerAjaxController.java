package com.group3.tofu.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
