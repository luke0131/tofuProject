package com.group3.tofu.product.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoHibernate implements ProductAjaxDao {
	
	@PersistenceContext
	private Session session;
	public Session getSession() {
		return this.session;
	}
	
	@Override
	public long count(JSONObject obj) {
//		select count(*) from product
//		where id=? and name like ? and price >= ? and make <= ? and expire = ?

		Integer id = obj.isNull("id") ? null : obj.getInt("id");
		String name = obj.isNull("name") ? null : obj.getString("name");
		Double price = obj.isNull("price") ? null : obj.getDouble("price");
		Integer expire = obj.isNull("expire") ? null : obj.getInt("expire");
		
		
		CriteriaBuilder criteriaBuilder = this.getSession().getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		
		//from product
		Root<Product> root = criteriaQuery.from(Product.class);
		
		//select count(*)
		criteriaQuery = criteriaQuery.select(criteriaBuilder.count(root));

		//where
		List<Predicate> predicates = new ArrayList<>(); 
		if(id!=null) {
			predicates.add(criteriaBuilder.equal(root.get("id"), id));
		}
		if(name!=null) {
			predicates.add(criteriaBuilder.like(root.get("name"), "%"+name+"%"));
		}
		if(price!=null) {
			predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("price"), price));
		}
		if(expire!=null) {
			predicates.add(criteriaBuilder.equal(root.get("expire"), expire));
		}		
		if(predicates!=null && !predicates.isEmpty()) {
			Predicate[] array = predicates.toArray(new Predicate[1]);
			criteriaQuery = criteriaQuery.where(array);
		}
		
		TypedQuery<Long> typedQuery = this.getSession().createQuery(criteriaQuery);

		Long result = typedQuery.getSingleResult();
		if(result!=null) {
			return result.longValue();
		} else {
			return 0;
		}
	}
	
	@Override
	public List<Product> find(Map<String, List<String>> obj) {
//		select * from product
//		where id=? and name like ? and price >= ? and make <= ? and expire = ?
		
		CriteriaBuilder criteriaBuilder = this.getSession().getCriteriaBuilder();
		CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
		
		//from product
		Root<Product> root = criteriaQuery.from(Product.class);
		
		//where
		Set<Predicate> predicates = new HashSet<Predicate>();
		
		System.out.println(obj);
		List<String> brands = obj.get("brand");
		List<String> categorys = obj.get("category");
		List<String> engineTypes = obj.get("engineType");
		System.out.println(brands);
		System.out.println(categorys);
		System.out.println(engineTypes);
		System.out.println("===========================");
		if(brands != null) {
			for(int i = 0 ; i < brands.size() ; i ++) {
				String brand = brands.get(i) ;
				predicates.add(criteriaBuilder.like(root.get("brand"), "%"+brand+"%"));
				System.out.println(brand);
			}
		}
		if(categorys != null) {
			for(int i = 0 ; i < categorys.size() ; i ++) {
				String category = categorys.get(i) ;
				predicates.add(criteriaBuilder.like(root.get("category"), "%"+category+"%"));
				System.out.println(category);
			}
		}
		if(engineTypes != null) {
			for(int i = 0 ; i < engineTypes.size() ; i ++) {
				String engineType = engineTypes.get(i) ;
				predicates.add(criteriaBuilder.or(criteriaBuilder.like(root.get("engineType"), "%"+engineType+"%")));
				System.out.println(engineType);
			}
		}
		System.out.println("===========================");
		System.out.println(predicates);
		
		if(predicates!=null && !predicates.isEmpty()) {
			Predicate[] array = predicates.toArray(new Predicate[1]);
			criteriaQuery = criteriaQuery.where(array);
		}
		
		TypedQuery<Product> typedQuery = this.getSession().createQuery(criteriaQuery);
		
		List<Product> result = typedQuery.getResultList();
		if(result!=null && !result.isEmpty()) {
			return result;
		} else {
			return null;
		}
		
//		int start = obj.isNull("start") ? 0 : obj.getInt("start");
//		int rows = obj.isNull("rows") ? 70 : obj.getInt("rows");

//		String brand = obj.isNull("brand") ? null : obj.getJSONArray("brand");
//		String category = obj.isNull("category") ? null : obj.getJSONArray("category");
//		String engineType = obj.isNull("engineType") ? null : obj.getJSONArray("engineType");
//		Integer productPrice = obj.isNull("productPrice") ? null : obj.getInt("productPrice");
		
//		if(brand!=null) {
//			predicates.add(criteriaBuilder.equal(root.get("brand"), brand));
//		}
//		if(category!=null) {
//			predicates.add((criteriaBuilder.equal(root.get("category"), category));
//		}
//		if(engineType!=null) {
//			predicates.add(criteriaBuilder.equal(root.get("engineType"), engineType));
//		}
//		if(productPrice!=null) {
//			predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("productPrice"), productPrice));
//		}
//		if(brand!=null || category!=null || engineType!=null) {
//			predicates.add(criteriaBuilder.or(criteriaBuilder.like(root.get("brand"), "%"+brand+"%")
//					,criteriaBuilder.like(root.get("category"), "%"+category+"%")
//					,criteriaBuilder.like(root.get("engineType"), "%"+engineType+"%")
//					));
//		}
		
	}
	
	@Override
	public Product update(Product bean) {
		if(bean!=null && bean.getBrand() !=null) {
			Product temp = this.getSession().get(Product.class, bean.getBrand());
			if(temp!=null) {
				return (Product) this.getSession().merge(bean);
			}
		}
		return null;
	}
	
	@Override
	public Product select(Integer id) {
		if(id != null) {
			return this.getSession().get(Product.class, id);
		}
		return null;
	}
	
	@Override
	public List<Product> select() {
		return this.getSession().createQuery(
				"FROM ProductBean", Product.class).list();
	}
	
	@Override
	public Product insert(Product bean) {
		if(bean!=null && bean.getBrand()!=null) {
			Product temp = this.getSession().get(Product.class, bean.getBrand());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
//	@Override
//	public Product update(String , Double price,
//			java.util.Date make, Integer expire, Integer id) {
//		if(id!=null) {
//			Product temp = this.getSession().get(Product.class, id);
//			if(temp!=null) {
//				temp.setName(name);
//				temp.setPrice(price);
//				temp.setMake(make);
//				temp.setExpire(expire);
//				return temp;
//			}
//		}
//		return null;
//	}
	
	@Override
	public boolean delete(Integer id) {
		if(id!=null) {
			Product temp = this.getSession().get(Product.class, id);
			if(temp!=null) {
				this.getSession().delete(temp);
				return true;
			}
		}
		return false;
	}

	@Override
	public Product selectBrand(String brand) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
