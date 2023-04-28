package com.group3.tofu.gift.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.gift.model.bean.Gift;
import com.group3.tofu.gift.model.dao.GiftDAO;

@Service
public class GiftService {
	@Autowired
	private GiftDAO gDAO;
	
	public Gift findById(Integer id) {
		
		return gDAO.findById(id).get();
	}
}
