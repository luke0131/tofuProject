package com.group3.tofu.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.JsonObject;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;

//@SessionAttributes(names= {"accountName"})
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	// 尋找所有customer
	@GetMapping("/customer/all")
	public String findAllCustomers(Model model) {

		List<Customer> customerList = customerService.findAllCustomer();

		model.addAttribute("customerList", customerList);

		return "customer/profile";
	}

	// 顯示圖片在畫面上的controller，專門處理圖片的
	// 尋找customer的photo
	@GetMapping("/downloadPhoto/{customer_id}")
	public ResponseEntity<byte[]> downloadPhoto(@PathVariable Integer customer_id) {

		// 先從CustomerService裡面找findPhotoById的方法
		Customer photo = customerService.findPhotoById(customer_id);

		// 透過photo將file取出來
		byte[] photoFile = photo.getPhoto();

		// 重點是為了改header裡面的結構
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		// 資料, header, 回應標頭的狀態碼
		return new ResponseEntity<byte[]>(photoFile, headers, HttpStatus.OK);
	}

	// 製作find email and password 的 controller
//	@PostMapping("/customer/findemail")
//	@ResponseBody
//	public Customer findemail(@RequestBody String body , Model model) {
//		
//		JSONObject findemail = new JSONObject(body);
//		
//		findemail.put("email", email);
//		findemail.put("password", password);	
//	
//		Customer findEmailAndPassword = customerService.findEmailAndPassword(findemail.getString("email"), findemail.getString("password"));
//		
//		model.addAttribute("userName", findEmailAndPassword.getName());
//		System.out.println("執行成功");
//		
//		return findEmailAndPassword;
//	
//	}

	// 製作find email and password 的 controller
	@PostMapping("/customer/findemail")
	public String findemail(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {

		Customer findEmailAndPassword = customerService.findEmailAndPassword(email, password);

		session.setAttribute("accountName", findEmailAndPassword.getAccount());

		System.out.println("執行成功");

		return "redirect:/";
	}

	// 跳轉到登出
	@GetMapping("customer/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

}
