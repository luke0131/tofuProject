package com.group3.tofu.post.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.model.PostDao;


@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	

	
	//新增文章標題及內容
	public Post createPost(Post article) {	
		 Post post = postDao.save(article);
		 post.setHot(0);
		 return post;
		
	}
	
	
	public void updatePost(Post post) {
        postDao.save(post);
    }
	
	 public Optional<Post> findPostById(Integer post_id) {
	        return postDao.findById(post_id);
	    }
	
	//找全部
	public Page<Post> findAll(Integer pageNumber, Integer orderBy) {
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
	    return postDao.findAll(pgb);    
     }
	
	
	//關鍵字模糊搜尋
	public Page<Post> findByKeyword(String keyword, Integer pageNumber, Integer orderBy) {
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

	    Page<Post> page = postDao.findByPostTitleLike(keyword, pgb);

	    return page;
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
	@Modifying
	@Transactional
	public Post updatePostById(Integer post_id , Post newPost ) {
		Optional<Post> option = postDao.findById(post_id);
		
		if(option.isPresent()) {
			Post post = option.get();
			post.setTitle(newPost.getTitle());
//			post.setAdded(newPost.getAdded());
			
			postDao.save(post);
			return post;
		}
		
		return null;
	}
	

	

	//更新人氣
	@Transactional
	public void createHot(Integer post_id) {		
		Post post = postDao.findById(post_id).get();
		post.setHot(post.getHot() + 1);
		
	}

}
