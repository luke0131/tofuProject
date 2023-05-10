package com.group3.tofu.comment.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.group3.tofu.comment.model.CommentDetail;
import com.group3.tofu.comment.model.CommentDetailDAO;

@Service
public class CommentDetailService {

	@Autowired
	private CommentDetailDAO detailDao;
		
	
	public void insertDetail(CommentDetail detail) {
		detailDao.save(detail);
	}
	
	
	public CommentDetail findByDetailId(Integer comment_detailId) {
		
		Optional<CommentDetail> op = detailDao.findById(comment_detailId);
		
		if (op.isPresent()) {
			return op.get();
		}

		return null;
		
	}
	
	
	public void deleteById(Integer comment_detailId) {
		detailDao.deleteById(comment_detailId);
	}
	
	
	
	public List<CommentDetail>  getDetailById(Integer comment_id){
		
		return detailDao.findByCommentId(comment_id);
	}
	
	
	public List<CommentDetail> getCustomerDetailById(Integer customer_id){
		
		return detailDao.findByCustomerId(customer_id);
	}
	
	
	
	
	public Page<CommentDetail> findByDetailPage(Integer pageNumber) {
		PageRequest pgb = PageRequest.of(pageNumber - 1, 3, Direction.DESC, "commentDate");

		Page<CommentDetail> page = detailDao.findAll(pgb);

		return page;
	}
}
