package com.group3.tofu.customer.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.model.CustomerDao;



@Service
public class CustomerService {
	
	//先找到專屬的Dao
	@Autowired
	private CustomerDao customerDao;

	//findAllCustomer
	public List<Customer> findAllCustomer(){
		return customerDao.findAll();
	}
	
	//findPhotoById
	public Customer findPhotoById(Integer customer_id) {
		
		Optional<Customer> option = customerDao.findById(customer_id);
		
		if(option.isPresent()) {
			Customer customerPhoto = option.get();
			return customerPhoto;
		}
		return null;
	}
	
	//find Customer by email and password	
	public Customer findEmailAndPassword(String email  , String password) {
	
		Customer findByEmailAndPassword = customerDao.findByEmailAndPassword(email , password);
		
		
		
		
		return findByEmailAndPassword;
	}
	
}
