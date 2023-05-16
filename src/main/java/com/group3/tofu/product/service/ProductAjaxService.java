package com.group3.tofu.product.service;

import java.util.List;
import java.util.Map;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductAjaxDao;

@Service
@Transactional(rollbackFor={Exception.class})
public class ProductAjaxService {
	
	@Autowired
	private ProductAjaxDao productAjaxDAO = null ;
	
	public List<Product> find( Map<String, List<String>> body) {
		try {
			return productAjaxDAO.find(body);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public long count(String json) {
		try {
			JSONObject obj = new JSONObject(json);
			return productAjaxDAO.count(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
    public Product findByBrand(String brand) {
		return productAjaxDAO.selectBrand(brand);
	}
	
}
