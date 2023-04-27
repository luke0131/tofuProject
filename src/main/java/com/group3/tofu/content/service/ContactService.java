package com.group3.tofu.content.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.content.model.Contact;
import com.group3.tofu.content.model.ContactDao;

//把邏輯都寫在這
@Service
public class ContactService {

	@Autowired
	private ContactDao contactDao;
	
	
	public List<Contact> findAllContact(){
		return contactDao.findAll();
	}
	
	//新增使用者
	public Contact createUser(Contact contactName) {
		return contactDao.save(contactName);
	} 
	
	//查詢使用者
	public Contact findContactByName(String name) {
		return contactDao.findByName(name);
	}
	
	//查詢email
	public Contact findContactByEmail(String email) {
		return contactDao.findByEmail(email);
	}
}
