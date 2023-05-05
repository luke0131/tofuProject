package com.group3.tofu.order.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group3.tofu.order.model.bean.Order;

public interface OrderDAO extends JpaRepository<Order, Integer> {
	//HQL語法參考的是JAVA的class name(Order)跟property name(f_customer_id),不是SQL SERVER的table(Orders)跟Column name
	@Query(value = "from Order where f_customer_id = ?1")
	List<Order> findByCustomerId(Integer customerId);

}
