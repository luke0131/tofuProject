package com.group3.tofu.product.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="product_id")
	private Integer productId ;
	
	@Column(name="brand")
	private String brand ;
	
	@Column(name="product_model")
	private String productModel ;
	
	@Column(name="category")
	private String category ;
	
	@Column(name="engine_type")
	private String engineType ;
	
	@Column(name="displacement")
	private String displacement ;
	
	@Column(name="product_price")
	private Integer productPrice ;
	
	@Column(name="appearance_design")
	private String appearanceDesign ;
	
	@Column(name="car_interior")
	private String carInterior ;
	
	@Column(name="power_performance")
	private String powerPerformance ;
	
	@Column(name="color")
	private String color ;

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getProductModel() {
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getEngineType() {
		return engineType;
	}

	public void setEngineType(String engineType) {
		this.engineType = engineType;
	}

	public String getDisplacement() {
		return displacement;
	}

	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getAppearanceDesign() {
		return appearanceDesign;
	}

	public void setAppearanceDesign(String appearanceDesign) {
		this.appearanceDesign = appearanceDesign;
	}

	public String getCarInterior() {
		return carInterior;
	}

	public void setCarInterior(String carInterior) {
		this.carInterior = carInterior;
	}

	public String getPowerPerformance() {
		return powerPerformance;
	}

	public void setPowerPerformance(String powerPerformance) {
		this.powerPerformance = powerPerformance;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	public Product() {
		
	}

	
}
