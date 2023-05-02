package com.group3.tofu.gift.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.gift.model.bean.ShoppingCart;
import com.group3.tofu.gift.model.dao.ShoppingCartDAO;

@Service
public class ShoppingCartService {
	@Autowired
	private ShoppingCartDAO spcDAO;
	
	public ShoppingCart findById(Integer id) {
		return spcDAO.findById(id).get();
	}
	
	public List<ShoppingCart> findByCustomerId(Integer cusId) {
		return spcDAO.findByCustomerId(cusId);
	}
	
	public void remove(Integer cartID) {
		spcDAO.deleteById(cartID);
	}
}
