package com.group3.tofu.order.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name = "Order")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer oid;
	
	@Column(name = "order_number")
	private Integer orderNumber;
	
	@Column(name = "f_product_id")
	private Integer f_product_id;
	
	@Column(name = "f_gift_id")
	private Integer f_gift_id;
	
	@Column(name = "order_date")	
	private Date order_date;
	
	@Column(name = "shipped_date")	
	private Date shipped_date;
	
	@Column(name = "ship_address")	
	private String ship_address;
	
	@Column(name = "payment")	
	private String payment;
	
	@Column(name = "ship_status")	
	private String ship_status;
	
	@OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
	private OrderDetail orderDetail;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getF_product_id() {
		return f_product_id;
	}

	public void setF_product_id(Integer f_product_id) {
		this.f_product_id = f_product_id;
	}

	public Integer getF_gift_id() {
		return f_gift_id;
	}

	public void setF_gift_id(Integer f_gift_id) {
		this.f_gift_id = f_gift_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Date getShipped_date() {
		return shipped_date;
	}

	public void setShipped_date(Date shipped_date) {
		this.shipped_date = shipped_date;
	}

	public String getShip_address() {
		return ship_address;
	}

	public void setShip_address(String ship_address) {
		this.ship_address = ship_address;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getShip_status() {
		return ship_status;
	}

	public void setShip_status(String ship_status) {
		this.ship_status = ship_status;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	
	

}
