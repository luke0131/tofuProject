package com.group3.tofu.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.model.dao.OrderDAO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public Order findbyId() {
		return orderDAO.findById(1).get();
	}
	
	public void insert(Order order) {
		orderDAO.save(order);
	}
	
	public List<Order> findByCustomerId(Integer customerId) {
		return orderDAO.findByCustomerId(customerId);
	}
}
