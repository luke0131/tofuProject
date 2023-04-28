package com.group3.tofu.order.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "OrderDetail")
public class OrderDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderdetail_id")
	private Integer orderdetail_id;
	
	@Column(name = "f_order_id")
	private Integer f_order_id;
	
	@Column(name = "f_customer_id")
	private Integer f_customer_id;
	
	@Column(name = "f_employee_id")
	private String f_employee_id;
	
	@Column(name = "ship_name")
	private String ship_name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "required_date")
	private Date required_date;
	
	@Column(name = "freight")
	private Integer freight;
	
	@JsonIgnore
	@JoinColumn(name = "f_order_id", referencedColumnName = "order_id", nullable = false)
	@OneToOne
	private Order order;

	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public Integer getOrderdetail_id() {
		return orderdetail_id;
	}

	public void setOrderdetail_id(Integer orderdetail_id) {
		this.orderdetail_id = orderdetail_id;
	}

	public Integer getF_order_id() {
		return f_order_id;
	}

	public void setF_order_id(Integer f_order_id) {
		this.f_order_id = f_order_id;
	}

	public Integer getF_customer_id() {
		return f_customer_id;
	}

	public void setF_customer_id(Integer f_customer_id) {
		this.f_customer_id = f_customer_id;
	}

	public String getF_employee_id() {
		return f_employee_id;
	}

	public void setF_employee_id(String f_employee_id) {
		this.f_employee_id = f_employee_id;
	}

	public String getShip_name() {
		return ship_name;
	}

	public void setShip_name(String ship_name) {
		this.ship_name = ship_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getRequired_date() {
		return required_date;
	}

	public void setRequired_date(Date required_date) {
		this.required_date = required_date;
	}

	public Integer getFreight() {
		return freight;
	}

	public void setFreight(Integer freight) {
		this.freight = freight;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
