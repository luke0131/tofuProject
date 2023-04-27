package com.group3.tofu.customer.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import org.springframework.web.bind.annotation.RequestParam;

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
	public ResponseEntity<byte[]> downloadPhoto(@PathVariable Integer customer_id) throws IOException {

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
	@PostMapping("/customer/login/checkPage")
	public String findemail(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, Model model) {

		// 若錯誤的話就送error字串給他
		HashMap<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		if (email == null || email.length() == 0) {
			errors.put("email", "請輸入您的信箱");
		}

		if (password == null || password.length() == 0) {
			errors.put("password", "請輸入您的密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "customer/login";
		}

		// 呼叫model
		Customer loggedInCustomer = customerService.findEmailAndPassword(email, password);

		// 要下判斷式，當我今天資料庫有抓到這筆資料時，我就讓他登入進去;如果沒有抓到這筆資料，我就繼續讓他停留在login畫面
		if (loggedInCustomer != null) {
			session.setAttribute("loggedInCustomer", loggedInCustomer);

			// 當我剛註冊會員時，我會依照路徑給預設圖片
//			session.setAttribute("loginPic", loggedInCustomer.getPhoto());
//
//			// 為了要顯示圖片在hi!xxx旁邊，所以要用session getId，透過id找照片
//			session.setAttribute("loginID", loggedInCustomer.getCustomer_id());
			System.out.println("透過id找照片執行成功");
			return "redirect:/";
		} else {
			errors.put("loginFailed", "查無此會員資料，請重新輸入或立即註冊!");
			return "customer/login";

		}
	}

	// 跳轉到登出
	@GetMapping("customer/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 製作註冊的controller
//	@ResponseBody
//	@PostMapping("customer/createMember")
//	public Customer insert(@RequestBody Customer customer) {
//		
//		System.out.println("執行成功");
//		
////		return customerService.createMember(customer);
//		Customer test = customerService.createMember(customer);
//		return test;
//		
//	}

	// 製作註冊的controller，並且新增成功後，顯示Hi!xxx 在畫面
	@PostMapping("customer/createMember")
	public String insert(@RequestParam("account") String account, @RequestParam("email") String email,
			@RequestParam("password") String password, HttpSession session) throws Exception {

		Customer customer = new Customer();

		customer.setAccount(account);
		customer.setEmail(email);
		customer.setPassword(password);

		System.out.println("新增會員到資料庫，執行成功");

		customerService.createMember(customer);
//		// 呼叫model
//		Customer findEmailAndPassword = customerService.findEmailAndPassword(email, password);
//
//		// 要下判斷式，當我今天資料庫有抓到這筆資料時，我就讓他登入進去;如果沒有抓到這筆資料，我就繼續讓他停留在login畫面
//		if (findEmailAndPassword != null) {
//			session.setAttribute("accountName", findEmailAndPassword.getAccount());
			session.setAttribute("loggedInCustomer", customer);
//			System.out.println("從資料庫抓到資料，執行成功");
//		}

		return "redirect:/";
	}



}
