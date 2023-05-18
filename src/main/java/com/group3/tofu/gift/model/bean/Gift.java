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

import com.fasterxml.jackson.annotation.JsonIgnore;
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
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "descrip")
	private String desc;
	
	@Column(name = "isEnabled")
	private boolean isEnabled;
	
	@JsonIgnore
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public boolean isEnabled() {
		return isEnabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public List<ShoppingCart> getShoppingcarts() {
		return shoppingcarts;
	}

	public void setShoppingcarts(List<ShoppingCart> shoppingcarts) {
		this.shoppingcarts = shoppingcarts;
	}

	


}
