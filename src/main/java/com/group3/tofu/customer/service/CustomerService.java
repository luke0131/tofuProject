package com.group3.tofu.customer.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.model.CustomerDao;

@Service
public class CustomerService {

	// 先找到專屬的Dao
//	@Autowired
//	private CustomerDao customerDao;

	private final CustomerDao customerDao;
	private final MailService mailService;

	public CustomerService(CustomerDao customerDao, MailService mailService) {
		this.customerDao = customerDao;
		this.mailService = mailService;
	}

	// findAllCustomer
	public List<Customer> findAllCustomer() {
		return customerDao.findAll();
	}

	// findPhotoById
	public Customer findPhotoById(Integer customer_id) {

		Optional<Customer> option = customerDao.findById(customer_id);

		if (option.isPresent()) {
			Customer customerPhoto = option.get();
			return customerPhoto;
		}
		return null;
	}

	// find Customer by email and password
	public Customer findEmailAndPassword(String email, String password) {

		Customer findByEmailAndPassword = customerDao.findByEmailAndPassword(email, password);

		if (findByEmailAndPassword == null) {
			return null;
		}
		return findByEmailAndPassword;
	}

	// find Customer by email
	public Optional<Customer> findCustomerByEmail(String email) {
		return Optional.ofNullable(customerDao.findByEmail(email));
	}

	// create member
	public Customer createMember(Customer customer) {
		return customerDao.save(customer);
	}

	@Transactional
	public Customer updateMember(Customer customer) {
		return customerDao.save(customer);
	}

	// update member
//	public Customer updateMember(String body , HttpSession session) {
//		
//		Customer oldCustomer = (Customer)session.getAttribute("loggedInCustomer");
//		
//		String oldEmail = oldCustomer.getEmail();
//		
//	
//		JSONObject obj = new JSONObject(body);
//		String name = obj.isNull("name") ? null : obj.getString("name");
//		//String email = obj.isNull("email") ? null : obj.getString("email");
//		//String account = obj.isNull("account") ? null : obj.getString("account");
//		String password = obj.isNull("password") ? null : obj.getString("password");
//		String phone = obj.isNull("phone") ? null : obj.getString("phone");
//		String birthday = obj.isNull("birthday") ? null : obj.getString("birthday");
//		Integer age = obj.isNull("age") ? null : obj.getInt("age");
//		String gender = obj.isNull("age") ? null : obj.getString("age");
//		String address = obj.isNull("address") ? null : obj.getString("address");
//	
//		Customer customer = new Customer();
//		customer.setName(name);
//		customer.setEmail(oldEmail);
//		
//		
//		
//		customerDao.save(customer);
//		session.setAttribute("loggedInCustomer", customer);
//		
//		
//		return customer;
//	}

	// 檢查帳號是否已經被註冊(一般的controller用)
	public Optional<Customer> findByAccount(String account) {
		return customerDao.findCustomerByAccount(account);
	}

	// 檢查帳號是否存在(ajax用)
	public boolean checkAccountExist(String account) {
		return findByAccount(account).isPresent();
	}

	// findCustomerById
	public Optional<Customer> findCustomerById(Integer id) {
		return customerDao.findById(id);
	}

	// send email
	public void sendVerificationEmail(Customer customer) {
		String email = customer.getEmail();
		String subject = "豆腐車業會員註冊驗證信";
		String content = "<h2>請點選以下連結驗證您的Email：<br/>" + "<a href =\"http://localhost:8080/tofu/customer/verify?email="
				+ email + "\">啟用會員</a><h2>";

		mailService.sendEmail(email, subject, content);
	}

	/*
	 * // 產生40個token數字 public String generateRandomToken() { return
	 * RandomStringUtils.randomAlphanumeric(40); }
	 * 
	 * @Modifying
	 * 
	 * @Transactional public void enableAccount(String email, String token) {
	 * //如果找不到就回傳空值 Optional<Customer> optional = findCustomerByEmail(email);
	 * if(optional.isEmpty()) { return; }
	 * 
	 * //如果有找到，就跟拿到的token比對，並且將enable設為1(true) Customer customer = optional.get();
	 * if(customer.getVerification().equals(token)) { customer.setEnabled(true); } }
	 */

	@Modifying
	@Transactional
	public void enableAccount(String email) {
		// 如果找不到就回傳空值
		Optional<Customer> optional = findCustomerByEmail(email);
		if (optional.isEmpty()) {
			return;
		}

		// 如果有驗證成功，就將enabled狀態設為1
		Customer customer = optional.get();
		customer.setEnabled(true);

	}

	// find Customer by email and password isEnabled
	public boolean isEnabled(String email, String password) {

		Customer customer = customerDao.findByEmailAndPassword(email, password);

		if (customer != null) {
			return customer.getEnabled();
		}
		return false;
	}

	// update profile
	@Transactional
	public Customer updateProfile(Customer c, MultipartFile uploadImg, HttpSession session) throws IOException {
		// 先把之前存在session裡面的物件拿出來，因為我要透過email找人
		Customer oldCustomer = (Customer) session.getAttribute("loggedInCustomer");

		//把email設進去
		String oldEmail = oldCustomer.getEmail();

		System.out.println(c.getName() + " " + c.getPhone());

		Optional<Customer> option = findCustomerByEmail(oldEmail);

		//如果email存在，我就透過使用者輸入的值，並將其設值進去
		if (option.isPresent()) {
			Customer customer = option.get();
			customer.setName(c.getName());
			customer.setPhone(c.getPhone());
			customer.setBirthday(c.getBirthday());
			customer.setAge(c.getAge());
			customer.setGender(c.getGender());
			customer.setAddress(c.getAddress());
			
			System.out.println(c.getGender());
			//單獨判斷圖片，如果有上傳圖片，我就設圖片給他，反之如果沒有設圖片進去，我就用預設圖片就好
			if (!uploadImg.isEmpty()) {
				customer.setPhoto(uploadImg.getBytes());
			}

			System.out.println("修改個人資料成功!!");

			session.setAttribute("loggedInCustomer", customer);

			return customer;
		}

		return null;

	}
}
