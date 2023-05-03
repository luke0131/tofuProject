package com.group3.tofu.comment.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.model.CommentDAO;
import com.group3.tofu.comment.model.CommentDetailDAO;
import com.group3.tofu.customer.model.CustomerDao;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private CommentDetailDAO commentDetailDAO;
	
	@Autowired
	private CustomerDao customerDao;
	
	
	
	//用comment_id找資料
	public Comment findByCommentId (Integer comment_id) {
		Optional<Comment> opComment = commentDAO.findById(comment_id);
		return opComment.isPresent() ? opComment.get() : null;
	} 
	
	//用comment_id刪除資料
		public void deleteByPostId(Integer comment_id) {
			commentDAO.deleteById(comment_id);
		}
		
		
	
}
