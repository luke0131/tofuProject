package com.group3.tofu.comment.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.model.CommentDAO;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;
	

	//insert文章標題及內容
	public Comment createComment(Comment comment) {
		return commentDAO.save(comment);
	}
		
		
	
	
	//找全部的文章內容
	public List<Comment> getAllComment(){
		return commentDAO.findAll();
	}
	
	
	//用comment_id找資料
	public Comment findByCommentId (Integer comment_id) {
		Optional<Comment> opComment = commentDAO.findById(comment_id);
		return opComment.isPresent() ? opComment.get() : null;
	}
	
	
	
	//用f_post_id帶進新增內容的畫面
	public Comment getByFkPostId(Integer f_post_id) {
	
		return commentDAO.findByFkPostId(f_post_id);		
	}
	
	
	public Comment getByCommentId (Integer comment_id) {
		
		return commentDAO.findByCommentId(comment_id);
	}
	
	
	
	//用comment_id刪除資料
		public void deleteByCommentId(Integer comment_id) {
			commentDAO.deleteById(comment_id);
		}
		
		
		
		
	
}
