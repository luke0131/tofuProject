package com.group3.tofu.order.controller;

import java.util.List;

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
	
	@GetMapping("order/findByPayment")
	public String findByPayment(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber,Model model) {
		
		List<Order> orders = orderService.findByPayment("未付款");
		
		int pages=pageNumber-1;
		int count=2;
		int totalpage = 0;
		if (orders.size()%count == 0) {
			totalpage = orders.size()/count;
		}else {
			totalpage = orders.size()/count +1;
		}
		int start = (0+pages)*count;
		int end=count*(pages+1);
		
		List<Order> subList = orders.subList(start, end);
		model.addAttribute("page",subList);
		model.addAttribute("totalpage",totalpage);
		
		return "order/showOrder";
	}
}
