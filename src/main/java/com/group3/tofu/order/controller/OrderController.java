package com.group3.tofu.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@GetMapping("order/find")
	public String findCustomerOrder() {
		
//		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
//		Integer customerId= customer.getCustomer_id();
//		
		List<Order> orders = orderService.findByCustomerId(1);
		for (Order order : orders) {
			System.out.println("-------------------++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------");
			System.out.println(order.getOrder_date()+"--------------------------------------------------------");
			System.out.println(order.getShip_address()+"--------------------------------------------------------");
		}
		
		
		return "order/showOrder";
	}
}
