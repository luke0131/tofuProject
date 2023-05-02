package com.group3.tofu.gift.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "ShoppingCart")
public class ShoppingCart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cart_id")
	private Integer id;
	
	@Column(name = "f_customer_id")
	private Integer f_cID;
	
	@JoinColumn(name = "f_gift_id", referencedColumnName = "gift_id")
	@ManyToOne
	private Gift gift;
	
	@Column(name = "gift_qty")
	private Integer qty;
	
	

	public Integer getId() {
		return id;
	}



	public Integer getF_cID() {
		return f_cID;
	}



	public void setF_cID(Integer f_cID) {
		this.f_cID = f_cID;
	}



	public Gift getGift() {
		return gift;
	}



	public void setGift(Gift gift) {
		this.gift = gift;
	}



	public Integer getQty() {
		return qty;
	}



	public void setQty(Integer qty) {
		this.qty = qty;
	}



	public void setId(Integer id) {
		this.id = id;
	}

	
	
	
	
	
}
