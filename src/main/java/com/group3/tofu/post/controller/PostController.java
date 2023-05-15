package com.group3.tofu.post.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.service.CommentService;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;
import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private CustomerService customerService;

	// 跳轉到新增的畫面
	@GetMapping("/showPost/add")
	public String addPost(Model model, HttpSession session) {
		
		Customer customer = (Customer) session.getAttribute("loggedInCustomer");
		
		
		System.out.println("尚未登入-------------" + customer);
		
		if(customer == null) {
			model.addAttribute("message", "請先登入會員");
			return "customer/login";
		}
		
		
		return "comment/addNewPost";
	}
	
	
	

	// 新增文章標題，並轉到標題
	@PostMapping("/showPost")
	public String createNewPost(@RequestParam String title, @RequestParam String text, @ModelAttribute Post post, HttpSession session) {

		Customer customer = (Customer) session.getAttribute("loggedInCustomer");
		
		//Integer customerId = customer.getCustomer_id();

		String oldCustomer = customer.getEmail();

		Optional<Customer> option = customerService.findCustomerByEmail(oldCustomer);

		if (option.isPresent()) {
			
			Customer newCustomer = option.get();
			
			Post postTitle = new Post();
			postTitle.setTitle(title);		
			
			postService.createPost(postTitle);

			Comment comment = new Comment();
			comment.setText(text);
			
			comment.setPost(postTitle);
			comment.setCustomer(newCustomer);
			
//			postService.createPost(postTitle);
			commentService.createComment(comment);

			session.setAttribute("loggedInCustomer", newCustomer);
			
			
			
			return "redirect:/showPost";

		}

		return "customer/login";
	}

	// 分頁
	@GetMapping("/showPost")
	public String showPost(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
							@RequestParam(name = "keyword", required = false) String keyword,
					Model model,HttpSession session) {
		Integer orderBy = 0;
		if(session.getAttribute("orderBy") != null) {
			orderBy = (Integer)session.getAttribute("orderBy");
		}
		
		Page<Post> page;
	    if (keyword == null || keyword.isEmpty()) {
	        page = postService.findAll(pageNumber,orderBy);
	    } else {
	        page = postService.findByKeyword(keyword, pageNumber, orderBy);
	        
	        model.addAttribute("keyword", keyword);
	    }

	model.addAttribute("page", page);
	
session.setAttribute("orderBy", orderBy);	
		
		
	return "comment/post";
	}
	
	//紀錄人氣排序
	@GetMapping("/orderBy")
	public String orderBy(@RequestParam("orderBy") Integer orderBy, HttpSession session) {
		session.setAttribute("orderBy", orderBy);
		
		return "redirect:/showPost";
	}
	
	
	//點文章標題，讓人氣值+1
	@PutMapping("/updateHot")
	public String updateHot(@RequestParam("post_id") Integer post_id) {
	    postService.increaseHot(post_id);
	    return "redirect:/showPost";
	}



	
	
}
