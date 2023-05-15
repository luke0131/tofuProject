package com.group3.tofu.content.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.content.model.Contact;
import com.group3.tofu.content.model.ContactDao;
import com.group3.tofu.customer.service.MailService;

//把邏輯都寫在這
@Service
public class ContactService {

	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private MailService mailService;
	
	
	public List<Contact> findAllContact(){
		return contactDao.findAll();
	}
	
	//新增使用者
	public Contact saveContact(Contact contact) {
		return contactDao.save(contact);
	} 
	
	//查詢使用者
	public Contact findContactByName(String name) {
		return contactDao.findByName(name);
	}
	
	//查詢email
	public Contact findContactByEmail(String email) {
		return contactDao.findByEmail(email);
	}
	
	//寄信
	public void sendContactEmail(Contact contact) {
		
		String contactEmail = contact.getEmail();//信箱
		String subject = "豆腐車業股份有限公司";
		String content = "感謝您的來信";
		
		mailService.sendEmail(contactEmail, subject, content);
		
	}
	
	
	
	
	
	
	
	
}
