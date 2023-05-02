package com.group3.tofu.gift.model.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "Gift")
public class Gift {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "gift_id")
	private Integer id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "price")
	private Integer price;
	
	@Column(name = "photo")
	private byte[] photo;
	
	@OneToMany(mappedBy = "gift",cascade = CascadeType.ALL)
	private List<ShoppingCart> shoppingcarts;
	
	public Gift() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public List<ShoppingCart> getShoppingcarts() {
		return shoppingcarts;
	}

	public void setShoppingcarts(List<ShoppingCart> shoppingcarts) {
		this.shoppingcarts = shoppingcarts;
	}

	
	
	

}
