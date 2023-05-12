package com.group3.tofu.post.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.model.PostDao;


@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	

	
	//insert文章標題及內容
	public Post createPost(Post post) {
		return postDao.save(post);
	}
	

	
	//找全部
	public List<Post> getAllPost(){
		return postDao.findAll();
	}
	
	//用post_id找資料
	public Post findByPostId(Integer post_id) {
		
		Optional<Post> op = postDao.findById(post_id);
		
		if(!op.isEmpty()) {
			return op.get();
		}
		
		return null;
	}
	
	//找最新的
	public Post findLastest() {
		return postDao.findFirstByOrderByAddedDesc();
	}
	
	//用f_customer_id帶到新增回來的畫面
	public Post getByFkCustomerId(Integer f_customer_id) {
		
		return postDao.findByFkCustomerId(f_customer_id);
	}
	
	
	//用post_id刪除資料
	public void deleteByPostId(Integer post_id) {
		postDao.deleteById(post_id);
	}
	
	
	//更新資料
	@Transactional
	public Post updatePostById(Integer post_id , String newPost) {
		Optional<Post> option = postDao.findById(post_id);
		
		if(option.isPresent()) {
			Post post = option.get();
			post.setTitle(newPost);
			return post;
		}
		
		return null;
	}
	
	//分頁
	public Page<Post> findByPage(Integer pageNumber , Integer orderBy ) {
		PageRequest pgb = null;
		if(orderBy == 0) {
			pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "added");
		}
		if(orderBy == 1) {
			pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "added");
		}
		if(orderBy == 2) {
			pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "hot");
		}
		
		if(orderBy == 3) {
			pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "hot");
		}

		
		Page<Post> page = postDao.findAll(pgb);

		return page;
	}
}
