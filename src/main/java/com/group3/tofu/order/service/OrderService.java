package com.group3.tofu.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.model.dao.OderDAO;

@Service
public class OrderService {
	
	@Autowired
	private OderDAO orderDAO;
	
	
	public List<Order> findByCustomerId(Integer customerId) {	
		return orderDAO.findByCustomerId(customerId);
	}
}
