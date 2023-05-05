package com.group3.tofu.comment.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.group3.tofu.post.model.Post;

@Entity
@Table(name= "Comment")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private Integer comment_id;
	
	@Column(name = "text")
	private String text;
	
	@OneToOne
	@JoinColumn(name="f_post_id",referencedColumnName = "post_id")
	private Post post;
	
	@Column(name = "authorName")
	private String authorName;
	
	@Column(name = "create_date" , columnDefinition = "DATE")
	private LocalDate create_date;
	
	@OneToMany(mappedBy = "comment" , cascade = CascadeType.ALL)
	private List<CommentDetail> commentDetail;

	public Integer getComment_id() {
		return comment_id;
	}
	
	public Comment() {

	}

	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public LocalDate getCreate_date() {
		return create_date;
	}

	public void setCreate_date(LocalDate create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", text=" + text + ", post=" + post + ", authorName=" + authorName
				+ ", create_date=" + create_date + "]";
	}
	
	
	
}
