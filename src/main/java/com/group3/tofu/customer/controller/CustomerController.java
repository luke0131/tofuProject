package com.group3.tofu.customer.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;

//@SessionAttributes(names= {"accountName"})
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	// 尋找所有customer
	@GetMapping(path = "/customer/all")
	public String findAllCustomers(Model model) {

		List<Customer> customerList = customerService.findAllCustomer();

		model.addAttribute("customerList", customerList);

		return "customer/profile";
	}

	// 顯示圖片在畫面上的controller，專門處理圖片的
	// 尋找customer的photo
	@GetMapping(path = "/downloadPhoto/{customer_id}")
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

	@GetMapping(path = "/findCustomerById/{id}")
	@ResponseBody
	public Customer findCustomerById(@PathVariable("id") Integer id) {
		return customerService.findCustomerById(id).get();
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
	@PostMapping(path = "/customer/login/checkPage")
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

			// 判斷有沒有enabled
			if (!loggedInCustomer.getEnabled()) {
				errors.put("enabled", "信箱未驗證，請檢查驗證信!");
				return "customer/login";
			}

			session.setAttribute("loggedInCustomer", loggedInCustomer);

			System.out.println("透過id找照片執行成功");

			return "redirect:/";

		} else {
			errors.put("loginFailed", "查無此會員資料，請重新輸入或立即註冊!");

			return "customer/login";

		}
	}

	// 跳轉到登出
	@GetMapping(path = "customer/logout")
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
	@PostMapping(path = "customer/createMember")
	public String insert(@RequestParam("account") String account, @RequestParam("email") String email,
			@RequestParam("password") String password, HttpSession session) throws Exception {

		Customer customer = new Customer();

		customer.setAccount(account);
		customer.setEmail(email);
		customer.setPassword(password);

		System.out.println("新增會員到資料庫，執行成功");

		customerService.createMember(customer);

		customerService.sendVerificationEmail(customer);

		// 判斷有沒有enabled
		if (!customer.getEnabled()) {
			return "customer/checkEnabled";
		} else {
			System.out.println(customer);

			session.setAttribute("loggedInCustomer", customer);

			return "redirect:/";

		}

	}

	/*
	 * @GetMapping(path = "customer/verify")
	 * 
	 * @ResponseBody public String verifyEmail(@RequestParam(value="token") String
	 * token, @RequestParam(value="email") String email) {
	 * System.out.println("email: " + email + "verified");
	 * customerService.enableAccount(email, token); return "驗證成功"; }
	 */

	// 驗證email
	@GetMapping(path = "customer/verify")
//	@ResponseBody
	public String verifyEmail(@RequestParam("email") String email) {
		System.out.println("email: " + email + "verified");
		customerService.enableAccount(email);
		return "customer/login";
	}

	// 更新個人資料
	@PostMapping(path = "customer/update")
	public String updateProfile(@ModelAttribute Customer c, @RequestParam(required = false) MultipartFile uploadImg,
			HttpSession session) throws IOException {

		customerService.updateProfile(c, uploadImg, session);

		return "customer/updateProfile";
	}

}
