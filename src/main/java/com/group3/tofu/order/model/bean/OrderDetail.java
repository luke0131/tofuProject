package com.group3.tofu.order.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "OrdersDetail")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_did")
	private Integer id;
	
	@Column(name = "gid")
	private Integer gid;
	
	@Column(name = "qty")
	private Integer qty;
	
	@Column(name = "price")
	private Integer price;
	
	@JoinColumn(name = "f_order_id", referencedColumnName = "order_id")
	@ManyToOne
	private Order order;
	

	public OrderDetail() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getGid() {
		return gid;
	}


	public void setGid(Integer gid) {
		this.gid = gid;
	}


	public Integer getQty() {
		return qty;
	}


	public void setQty(Integer qty) {
		this.qty = qty;
	}


	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public Order getOrder() {
		return order;
	}


	public void setOrder(Order order) {
		this.order = order;
	}
	
	

}
