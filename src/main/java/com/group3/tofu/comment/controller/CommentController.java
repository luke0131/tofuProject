package com.group3.tofu.comment.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.model.CommentDetail;
import com.group3.tofu.comment.model.DetailDTO;
import com.group3.tofu.comment.service.CommentDetailService;
import com.group3.tofu.comment.service.CommentService;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;
import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.service.PostService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentDetailService detailService;
	
	@Autowired
	private CustomerService customerService;


	 	
//	 	//跳轉到討論區文章內容頁面
	 	@GetMapping("/comment/{comment_id}")
		public String showCommentPage(@PathVariable("comment_id") Integer comment_id , Model model) {
			
	 		Post allPost = postService.findByPostId(comment_id);
	 		Comment allComment = commentService.findByCommentId(comment_id);
	 		
	 		Customer allCustomer = customerService.findCustomerById(comment_id);
	 		
			List<CommentDetail> allDetail = detailService.getDetailById(comment_id);
//			List<CommentDetail> allCustomer = detailService.getCustomerDetailById(comment_id);
			
			//顯示標題
			model.addAttribute("allPost", allPost);
			
			//顯示內文
			model.addAttribute("allComment", allComment);
			
			
			//顯示留言
			model.addAttribute("allDetail", allDetail);
			
			//顯示留言者
			model.addAttribute("allCustomer", allCustomer);
						
			return "/comment/comment";
		}
	 	
	 	
	 	@ResponseBody
		@PostMapping("/comment/{comment_id}")
	 	public List<CommentDetail> addDetail(@PathVariable("comment_id") Integer comment_id, @RequestBody String body){
	 		
	 		JSONObject jsonObject = new JSONObject(body);
	 		String newDetail = jsonObject.getString("comment");
	 		
	 		
//	 		Customer newCustomer = customerService.findCustomerById(comment_id);
	 		Comment comment = commentService.findByCommentId(comment_id);	 			 		
	 		CommentDetail newCommentDetail = new CommentDetail();
	 		
//	 		newCommentDetail.setCustomer(newCustomer);
	 		newCommentDetail.setComment(comment);
	 		newCommentDetail.setComment_detail(newDetail);
	 		
	 		
	 		
	 		detailService.crateDetail(newCommentDetail);
	 		
	 		
	 		Page<CommentDetail> page = detailService.findByDetailPage(1);
	 		page.getContent().forEach((item)->{
	 			Date test = item.getCommentDate();
	 			System.out.println("------------------------------------------" + test);
	 		});
	 		List<CommentDetail> latestDetail = page.getContent();
	 		
	 		return latestDetail;
	 	}
	

	
}
