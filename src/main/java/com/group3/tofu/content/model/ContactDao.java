package com.group3.tofu.content.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactDao extends JpaRepository<Contact, Integer> {
	
	Contact findByName(String name);
	
	Contact findByPhone(String phone);
	
	Contact findByEmail(String email);
	
}
