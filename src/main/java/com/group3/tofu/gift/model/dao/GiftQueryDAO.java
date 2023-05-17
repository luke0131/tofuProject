package com.group3.tofu.gift.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.group3.tofu.gift.model.bean.Gift;

@Repository
@Transactional
public class GiftQueryDAO {
	//Hibernate Session
	@PersistenceContext
	private EntityManager em;
	
	public List<Gift> findByOption(String hql, int start) {
		TypedQuery<Gift> query = em.createQuery(hql,Gift.class);
		
		query.setFirstResult(start);
		query.setMaxResults(9);
		
		return query.getResultList();
	}
	public List<Gift> findBySearch(String sql, int start) {
		TypedQuery<Gift> query = em.createQuery(sql,Gift.class);
		
		query.setFirstResult(start);
		query.setMaxResults(9);
		
		return query.getResultList();
	}
	
}
