package com.group3.tofu.customer.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CustomerDao extends JpaRepository<Customer, Integer> {

	//find Customer by email and password
	
	@Query("from Customer where email = :email and password=:password")
	Customer findByEmailAndPassword(@Param("email") String email , @Param("password") String password);
}
