package com.group3.tofu.book.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BookDao extends JpaRepository<Book, Integer> {

	// HQL語法參考的是JAVA的class name(Book)跟property name(f_customer_id),不是SQL SERVER的table(Book)跟Column name
	@Query(value = "from Book where f_customer_id = ?1")
	List<Book> findBookByCustomerId(Integer customerId);
	
	@Query(value = "select count(*) from Book where status='waiting'", nativeQuery = true)
	Integer countBookWaiting();
	
	@Query(value = "select count(*) from Book where f_employee_id=:eid and status='assigned'", nativeQuery = true)
	Integer countBookAssigned(@Param("eid") Integer eid);

	@Query(value = "select * from Book where f_employee_id=:eid and status='assigned'", nativeQuery = true)
	List<Book> bookAssigned(@Param("eid") Integer eid);
}
