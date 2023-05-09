package com.group3.tofu.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.model.dao.OrderDAO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public Order findbyId(Integer id) {
		return orderDAO.findById(id).get();
	}
	
	public Order insert(Order order) {
		return orderDAO.save(order);
	}
	
	public List<Order> findByCustomerId(Integer customerId) {
		return orderDAO.findByCustomerId(customerId);
	}
	
	public List<Order> findAllOrders() {
		return orderDAO.findAll();
	}
	
	public Page<Order> findByPage(Integer pageNumber) {
		
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Direction.ASC, "id");
		Page<Order> page = orderDAO.findAll(pgb);
		return page;
	}
	
	public void removeOrder(Integer id) {
		orderDAO.deleteById(id);
	}
	
	public List<Order> findByPayment(String payment) {
		return orderDAO.findByPayment(payment);
	}
	
	public List<Order> findPaymentByPage(String payment) {
		
		List<Order> orders = orderDAO.findByPayment(payment);
		
		
		return orders;
	}
}
