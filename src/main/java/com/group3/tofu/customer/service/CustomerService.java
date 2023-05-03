package com.group3.tofu.customer.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.RandomStringUtils;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

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
		String subject = "Verify your email";
		// String content = "<p>請點選以下連結驗證您的Email：<br/>" + "<a href
		// =\"http://localhost:8080/tofu/customer/verify?email=" + email
		// + "&token" + customer.getVerification() + "\">點此驗證</a><p>";

		String content = "<p>請點選以下連結驗證您的Email：<br/>" + "<a href =\"http://localhost:8080/tofu/customer/verify?email="
				+ email + "\">點此驗證</a><p>";

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
	
	

}
