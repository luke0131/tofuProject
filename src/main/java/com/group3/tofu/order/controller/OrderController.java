package com.group3.tofu.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;
import com.group3.tofu.gift.model.bean.ShoppingCart;
import com.group3.tofu.gift.service.ShoppingCartService;
import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.model.bean.OrderDetail;
import com.group3.tofu.order.service.OrderDetailService;
import com.group3.tofu.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService odService;
	
	@Autowired
	private ShoppingCartService spcService;
	
	@Autowired
	private CustomerService cService;
	
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
	public String showDetail(@RequestParam(name = "id")Integer orderid,Model model) {
		
		Order order = orderService.findbyId(orderid);
		Integer customerId = order.getF_customer_id();
		
		Customer customer = cService.findCustomerById(customerId);
		List<OrderDetail> orderDetails = order.getOrderDetails();
		
		model.addAttribute("customer",customer);
		model.addAttribute("order",order);
		model.addAttribute("orderDetails",orderDetails);

		return "order/showDetail";
	}
	
	@GetMapping("order/showModify")
	public String showModify(@RequestParam(name = "id")Integer orderid,Model model) {
		Order order = orderService.findbyId(orderid);
		Integer customerId = order.getF_customer_id();
		
		Customer customer = cService.findCustomerById(customerId);
		
		model.addAttribute("customer",customer);
		model.addAttribute("order",order);
		
		return "order/modifyOrder";
	}
	@GetMapping("order/updateOrder")
	public String updateOrder(@RequestParam(name = "id")Integer orderid,
							  @RequestParam(name = "shipment")String shipment,
							  @RequestParam(name = "payment")String payment,
							  @RequestParam(name = "address")String address,Model model) {

		Order order = orderService.findbyId(orderid);
		
		order.setShip_status(shipment);
		order.setPayment(payment);
		order.setShip_address(address);
		orderService.insertOrder(order);
		
		String str = "redirect:/order/findAll" + orderid;
		System.out.println(str);
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
	
	@GetMapping("order/checkout")
	public String checkout(HttpSession session) {
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();

		
		Order newOrder = new Order();
		newOrder.setF_customer_id(customerId);
		newOrder.setShip_address(customer.getAddress());
		
		Order saved = orderService.insertOrder(newOrder);
		
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		
		for (ShoppingCart c : carts) {
			OrderDetail od = new OrderDetail();
			od.setGid(c.getGift().getId());
			od.setPrice(c.getGift().getPrice());
			od.setQty(c.getQty());
			od.setName(c.getGift().getName());
			od.setOrder(saved);

			
			odService.save(od);
		}
		
		return "123";
	}
	
	@GetMapping("order/test")
	public String insert(HttpSession session) {
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();

		
		Order newOrder = new Order();
		newOrder.setF_customer_id(customerId);
		newOrder.setShip_address(customer.getAddress());
		
		Order saved = orderService.insertOrder(newOrder);
		
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		
		for (ShoppingCart c : carts) {
			OrderDetail od = new OrderDetail();
			od.setGid(c.getGift().getId());
			od.setPrice(c.getGift().getPrice());
			od.setQty(c.getQty());
			od.setName(c.getGift().getName());
			od.setOrder(saved);
			
			odService.save(od);
		}
		
		return "redirect:/order/findAll";
	}
}
