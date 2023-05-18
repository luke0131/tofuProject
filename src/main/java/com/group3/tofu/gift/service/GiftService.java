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
import com.group3.tofu.gift.model.dao.GiftQueryDAO;
import com.group3.tofu.order.model.bean.Order;

@Service
public class GiftService {
	@Autowired
	private GiftDAO gDAO;
	
	@Autowired
	private GiftQueryDAO qDAO;
	
	public Gift findById(Integer id) {	
		return gDAO.findById(id).get();
	}
	
	public List<Gift> findAllGift() {	
		return gDAO.findAll();
	}
	
	public Page<Gift> findByEnable(Integer pageNumber) {	
		Pageable pgb = PageRequest.of(pageNumber-1, 9, Direction.ASC, "id");
		return gDAO.findByEnable(true,pgb);
	}
	
	public Page<Gift> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber-1, 9, Direction.ASC, "id");
		Page<Gift> page = gDAO.findAll(pgb);
		return page;
	}
	
	public void createGift(Gift newGift) {
		gDAO.save(newGift);
	}
	
	public Gift save(Gift gift) {
		return gDAO.save(gift);
	}
	
	public List<Gift> findBySearch(String search,int start) {
		String sql = "from Gift where";

		sql += " " + "name like" + "'%" + search + "%'";

		return qDAO.findBySearch(sql,start);
	}
	
	public List<Gift> findByOption(String tool,String food,String elec,String drink,String outdoor,Integer min,Integer max,int start) {
		
		String sql = "";
		String str = "";
		String hql = "";
		if(tool==null && food==null && elec==null && drink==null && outdoor==null && min==null && max==null) {
			sql = "from Gift";
		}else {
			sql = "from Gift where";
		}
		
		if (tool!=null) {
			if (str.equals("")) {
				str += " " + "type=" + "'" + tool + "'";
				System.out.println(str);
			}else {
				str += " " + "or" + " " + "type=" + "'" + tool + "'";
				System.out.println(str);				
			}
		}
		
		if (food!=null) {
			if (str.equals("")) {
				str += " " + "type=" + "'" + food + "'";
				System.out.println(str);
			}else {
				str += " " + "or" + " " + "type=" + "'" + food + "'";
				System.out.println(str);				
			}
		}
		
		if (elec!=null) {
			if (str.equals("")) {
				str += " " + "type=" + "'" + elec + "'";
				System.out.println(str);
			}else {
				str += " " + "or" + " " + "type=" + "'" + elec + "'";
				System.out.println(str);				
			}
		}
		
		if (drink!=null) {
			if (str.equals("")) {
				str += " " + "type=" + "'" + drink + "'" ;
				System.out.println(str);
			}else {
				str += " " + "or" + " " + "type=" + "'" + drink + "'";
				System.out.println(str);				
			}
		}
		
		if (outdoor!=null) {
			if (str.equals("")) {
				str += " " + "type=" + "'" + outdoor + "'";
				System.out.println(str);
			}else {
				str += " " + "or" + " " + "type=" + "'" +outdoor + "'";
				System.out.println(str);				
			}
		}
		
		if (min!=null) {
			if (str.equals("")) {
				str += " " + "price>" + min  ;
				System.out.println(str);
			}else {
				str += " " + "and" + " " + "price>" + min  ;
				System.out.println(str);				
			}
		}
		
		if (max!=null) {
			if (str.equals("")) {
				str += " " + "price<" + max  ;
				System.out.println(str);
			}else {
				str += " " + "and" + " " + "price<" + max  ;
				System.out.println(str);				
			}
		}
		hql = sql+str;
		System.out.println(hql);

		
		return qDAO.findByOption(hql,start);
	}
	
	
	
}
