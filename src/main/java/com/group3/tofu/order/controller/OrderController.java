package com.group3.tofu.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@GetMapping("order/findAll")
	public String findCustomerOrder(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<Order> page = orderService.findByPage(pageNumber);
		model.addAttribute("page",page);
		
		return "order/showOrder";
	}
	@GetMapping("order/removeOrder")
	public String removeOrder(@RequestParam(name = "id")Integer id) {
		
		orderService.removeOrder(id);
		
		return "redirect:/order/findAll";
	}
	
	@GetMapping("order/showDetail")
	public String showDetail() {
		
		
		
		return "order/showDetail";
	}
}
