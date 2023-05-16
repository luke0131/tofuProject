package com.group3.tofu.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group3.tofu.book.model.Book;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;
import com.group3.tofu.employee.model.Employee;
import com.group3.tofu.gift.model.bean.Gift;
import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.service.OrderService;
import com.group3.tofu.post.model.Post;
import com.group3.tofu.product.model.Product;

//@SessionAttributes(names= {"accountName"})
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@Autowired
	private OrderService orderService;

	// 尋找所有customer
	// 以及增加分頁功能
	@GetMapping(path = "mgm/customerManagement")
	public String findAllCustomers(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam(name = "keyword", required = false) String keyword, Model model, HttpSession session) {

		Page<Customer> page;
		
		if (keyword == null || keyword.isEmpty()) {
			page = customerService.findByPage(pageNumber);
		} else {
			page = customerService.findByKeyword(keyword, pageNumber);

			model.addAttribute("keyword", keyword);
		}

		// 要帶到下一頁，要用model帶過去
		model.addAttribute("page", page);

		// List<Customer> customerList = customerService.findAllCustomer();

		// session.setAttribute("customerList", customerList);

		return "mgm/customerManagement";
	}

	// 尋找屬於該customer的所有訂單
	@GetMapping(path = "/customer/queryOrder")
	public String findAllCustomerByOrderId(Model model, HttpSession session) {

		Customer customer = (Customer) session.getAttribute("loggedInCustomer");
		Integer cid = customer.getCustomer_id();

		List<Order> orders = customerService.findByCustomerId(cid);

		ArrayList<Product> products = new ArrayList<Product>();
		ArrayList<Employee> employees = new ArrayList<Employee>();

		for (Order order : orders) {
			System.out.println("----------------------------");
			System.out.println(order);
			Integer f_product_id = order.getF_product_id();
			Integer f_employee_id = order.getF_employee_id();

			// product productDao 用f_product_id找到Product物件
			Product product = customerService.findProductById(f_product_id);

			// employee EmployeeDao 用f_employee_id找到Employee物件
			Employee employee = customerService.findEmployeeById(f_employee_id);

			products.add(product);

			employees.add(employee);

		}
		session.setAttribute("orders", orders);
		session.setAttribute("products", products);
		session.setAttribute("employees", employees);

		System.out.println("查詢歷史訂單成功!");
		return "customer/queryOrder";
	}

	// 尋找屬於該customer的所有預約賞車紀錄
	@GetMapping(path = "/customer/queryBook")
	public String findAllCustomerByBookId(Model model, HttpSession session) {

		Customer customer = (Customer) session.getAttribute("loggedInCustomer");
		Integer cid = customer.getCustomer_id();

		List<Book> books = customerService.findBookByCustomerId(cid);

		ArrayList<Product> products = new ArrayList<Product>();
		ArrayList<Employee> employees = new ArrayList<Employee>();

		for (Book book : books) {

			Integer f_product_id = book.getF_product_id();
			
			Integer f_employee_id = book.getF_employee_id();

			// product productDao 用f_product_id找到Product物件
			Product product = customerService.findProductById(f_product_id);
			if (product == null) {
				Product product2 = new Product();
				products.add(product2);
			} else {
				products.add(product);
			}

			// employee EmployeeDao 用f_employee_id找到Employee物件
			if(f_employee_id == null) {
				Employee employee = new Employee();
				employees.add(employee);
			}else {
				Employee employee = customerService.findEmployeeById(f_employee_id);
				employees.add(employee);
			}


		}
		model.addAttribute("books", books);
		model.addAttribute("products", products);
		model.addAttribute("employees", employees);

		System.out.println("查詢預約賞車表單成功!");
		return "customer/queryBook";
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

	/*
	 * @GetMapping(path = "/findCustomerById/{id}")
	 * 
	 * @ResponseBody public Customer findCustomerById(@PathVariable("id") Integer
	 * id) { return customerService.findCustomerById(id); }
	 */
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
				errors.put("enabled", "有可能出現以下錯誤：<br/>" + "1.您的信箱未驗證<br/>" + "2.您的帳號被停權<br/>" + "若有需要請聯絡客服人員，謝謝!");
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

	// 製作find email and password 的 controller(for mgmDashboard用)
	@PostMapping(path = "mgm/Dashboard")
	public String findemailformgmDB(@RequestParam("email") String email, @RequestParam("password") String password,
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

			session.setAttribute("loggedInCustomerForDB", loggedInCustomer);

			return "mgm/Dashboard";

		} else {
			errors.put("loginFailed", "查無此會員資料，請重新輸入或立即註冊!");

			return "mgm/Management";

		}
	}

	// 跳轉mgmDB登出
	@GetMapping(path = "mgm/logout")
	public String logoutDB(HttpSession session) {
		session.invalidate();
		return "mgm/Management";
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
			HttpSession session, Model m) throws IOException {

		customerService.updateProfile(c, uploadImg, session);
		m.addAttribute("success", "true");
		System.out.println(m);

		return "customer/updateProfile";
	}

	// 測試的controller
	@GetMapping("/michael")
	public String michael() {
		System.out.println("近來michael了");
		return "customer/login";
	}

	// 更新訂單裡面的orderAddress
	@ResponseBody
	@PostMapping(path = "customer/updateAddress/{order_id}/{shipAddress}")
	public String updateAddress(@PathVariable("shipAddress") String address, @PathVariable("order_id") Integer order_id)
			throws IOException {
		System.out.println(address);
		System.out.println("---------------------------" + order_id);

		Order option = orderService.findbyId(order_id);

		System.out.println(option);

		option.setShip_address(address);

		orderService.insertOrder(option);

		return "redirect:/customer/queryOrder";
	}

	// 將coustomer 的 權限(enabled) 從 1 -> 0
	@ResponseBody
	@GetMapping(path = "mgm/stopAccount/{customerId}")
	public String enableAccountStop(@PathVariable("customerId") Integer customerId, Model model) {

		System.out.println("有進來stopAccount方法，成功停權!!");

		customerService.enableAccountStop(customerId);

		return "redirect:/mgm/customerManagement";
	}

	// 將coustomer 的 權限(enabled) 從 1 -> 0
	@ResponseBody
	@GetMapping(path = "mgm/recoverAccount/{customerId}")
	public String enableAccountRecover(@PathVariable("customerId") Integer customerId) {

		System.out.println("有進來recoverAccount方法，成功復權!!");

		customerService.enableAccountRecover(customerId);

		return "redirect:/mgm/customerManagement";
	}

}
