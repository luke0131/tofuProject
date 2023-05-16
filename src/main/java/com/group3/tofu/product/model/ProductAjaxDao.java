package com.group3.tofu.product.model;

import java.util.List;
import java.util.Map;


import org.json.JSONObject;

public interface ProductAjaxDao {
	
	public abstract Product select(Integer id);
	
	public abstract Product selectBrand(String brand);

	public abstract List<Product> select();

	public abstract Product insert(Product bean);

	public abstract boolean delete(Integer id);

	List<Product> find(Map<String, List<String>> body);

	long count(JSONObject obj);

	Product update(Product bean);
	
}