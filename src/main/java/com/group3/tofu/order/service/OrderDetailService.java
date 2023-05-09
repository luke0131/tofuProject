package com.group3.tofu.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.order.model.bean.OrderDetail;
import com.group3.tofu.order.model.dao.OrderDetailDAO;

@Service
public class OrderDetailService {
	@Autowired
	private OrderDetailDAO odDAO;
	
	public void save(OrderDetail orderDetail) {
		odDAO.save(orderDetail);
	}
}
