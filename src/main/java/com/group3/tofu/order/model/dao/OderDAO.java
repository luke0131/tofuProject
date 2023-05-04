package com.group3.tofu.order.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group3.tofu.order.model.bean.Order;

public interface OderDAO extends JpaRepository<Order, Integer> {
	
	@Query(value = "from Order where f_customer_id = ?1")
	List<Order> findByCustomerId(Integer customerId);
}
