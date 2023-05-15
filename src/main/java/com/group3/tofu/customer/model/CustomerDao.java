package com.group3.tofu.customer.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CustomerDao extends JpaRepository<Customer, Integer> {

	// find Customer by email and password
	@Query("from Customer where email = :email and password=:password")
	public Customer findByEmailAndPassword(@Param("email") String email, @Param("password") String password);

	// 檢查帳號是否已經被註冊
	public Optional<Customer> findCustomerByAccount(String account);

	// 透過email找顧客
	public Customer findByEmail(String email);

	@Query("from Customer where customer_id = :customer_id")
	public Customer select(@Param("customer_id") String customer_id);

	// 模糊搜尋顧客姓名
	@Query(value = "select * from Customer where name like %:name%", nativeQuery = true)
	Page<Customer> findByCustomerNameLike(@Param("name") String keyword, Pageable pageble);

}
