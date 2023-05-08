package com.group3.tofu.gift.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
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
	
	public List<Gift> findAllGift() {	
		return gDAO.findAll();
	}
	
	public Page<Gift> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber-1, 9, Direction.ASC, "order_id");
		Page<Gift> page = gDAO.findAll(pgb);
		return page;
	}
	
	public void createGift(Gift newGift) {
		gDAO.save(newGift);
	}
	
}
