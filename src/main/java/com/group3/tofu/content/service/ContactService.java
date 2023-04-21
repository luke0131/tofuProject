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
	
}
