package com.group3.tofu.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.book.model.Book;
import com.group3.tofu.book.model.BookDao;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.model.CustomerDao;

@Service
public class BookService {
	
	@Autowired
	private BookDao bookDAO ;
	
	@Autowired
	private CustomerDao customerDAO ;
	
	public void saveBook(Book book) {
		bookDAO.save(book);
    }	
	
	public Integer findCustomerId(String name) {
		Customer c = customerDAO.findByCustomerName(name);
		
		if (c != null) {
            return c.getCustomer_id();
        }
		
		return null ;
	}
}
