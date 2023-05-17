package com.group3.tofu.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.group3.tofu.customer.service.MailService;
import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.model.dao.OrderDAO;
import com.group3.tofu.order.model.dao.OrderQueryDAO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private OrderQueryDAO oqDAO;;
	
	public Order findbyId(Integer id) {
		return orderDAO.findById(id).get();
	}
	
	public Order insertOrder(Order order) {
		return orderDAO.save(order);
	}
	
	public List<Order> findByCustomerId(Integer customerId) {
		return orderDAO.findByCustomerId(customerId);
	}
	
	public List<Order> findAllOrders() {
		return orderDAO.findAll();
	}
	
	public Page<Order> findByPage(Integer pageNumber) {
		
		Pageable pgb = PageRequest.of(pageNumber-1, 10, Direction.DESC, "id");
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
	
	public List<Order> findByShipment(Integer pageNumber,String status) {
		
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Direction.DESC, "id");
		return orderDAO.findByShipment(status,pgb);
	}
	
	public Page<Order> findByShipment2(Integer pageNumber,String status) {
		
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Direction.DESC, "id");
		return orderDAO.findByShipment2(status,pgb);
	}
	
	public void mailOrder(String content) {
		String email = "tofucars@gmail.com";
		String subject = "豆腐車業會員購買商品紀錄";

		mailService.sendEmail(email, subject, content);
	}
	
	public List<Order> findByOption(String payment,String shipment,String status,Integer start) {
				
		String sql = "from Order where";
		String str = "";
		String hql = "";
		
		if(payment != null) {
			str += " " + "payment=" + "'" + payment + "'";
			System.out.println(str);
		}
		if(shipment != null) {
			if(str.equals("")) {
				str += " " + "ship_status=" + "'" + shipment + "'";
				System.out.println(str);				
			}else {
				str += " " + "and ship_status=" + "'" + shipment + "'";
				System.out.println(str);			
			}
		}
		if(status != null) {
			if(str.equals("")) {
				str += " " + "order_status=" + "'" + status + "'";
				System.out.println(str);				
			}else {
				str += " " + "and order_status=" + "'" + status + "'";
				System.out.println(str);			
			}
		}
		hql = sql + str;
		
		System.out.println("TOTAL COUNT = " + oqDAO.count(hql));
		
		return oqDAO.findByOption(hql,start);
	}
	
	public int findTotalCount(String payment,String shipment,String status) {
		
		String sql = "from Order where";
		String str = "";
		String hql = "";
		
		if(payment != null) {
			str += " " + "payment=" + "'" + payment + "'";
			System.out.println(str);
		}
		if(shipment != null) {
			if(str.equals("")) {
				str += " " + "ship_status=" + "'" + shipment + "'";
				System.out.println(str);				
			}else {
				str += " " + "and ship_status=" + "'" + shipment + "'";
				System.out.println(str);			
			}
		}
		if(status != null) {
			if(str.equals("")) {
				str += " " + "order_status=" + "'" + status + "'";
				System.out.println(str);				
			}else {
				str += " " + "and order_status=" + "'" + status + "'";
				System.out.println(str);			
			}
		}
		hql = sql + str;
		
		System.out.println("TOTAL COUNT = " + oqDAO.count(hql));
		
		return oqDAO.count(hql);
	}

}
