package com.group3.tofu.content.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.group3.tofu.comment.model.Post;
import com.group3.tofu.comment.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService pService;
	
	
	//跳轉到討論區頁面(還要思考)
		@GetMapping("/post")
		public ModelAndView addPostPage(ModelAndView mav) {
			Post post = new Post();
			
			mav.addObject("comment" , post);
			mav.setViewName("comment/post");
			
			Post latest = pService.findLastest();
			
			mav.addObject("latest" , latest);
			return mav;
		}
		
		
}
