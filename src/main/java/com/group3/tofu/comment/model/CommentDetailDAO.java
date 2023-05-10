package com.group3.tofu.comment.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface CommentDetailDAO extends JpaRepository<CommentDetail, Integer>{

	@Query(value = "from CommentDetail where f_comment_id =:f_comment_id")
	List<CommentDetail> findByCommentId(@Param("f_comment_id") Integer f_comment_id);
	
	@Query(value = "from CommentDetail where f_customer_id =:f_customer_id")
	List<CommentDetail> findByCustomerId(@Param("f_customer_id") Integer f_customer_id);
	
	
}
