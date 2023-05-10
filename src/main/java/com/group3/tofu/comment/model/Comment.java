package com.group3.tofu.comment.model;

import java.util.Date;
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
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
	
	@JsonIgnore
	@OneToOne
	@JoinColumn(name="f_post_id",referencedColumnName = "post_id")
	private Post post;
	
	@Column(name = "authorName")
	private String authorName;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm EEEE")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm EEEE")
	@Column(name = "create_date")
	private Date createDate;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "comment" , cascade = CascadeType.ALL)
	private List<CommentDetail> commentDetail;
	
	
	@PrePersist // 當物件要轉換成 Persistent 狀態時，發動該方法
	public void onCreate() {
		if (createDate == null) {
			createDate = new Date();
		}
	}

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

	public Date getCreate_date() {
		return createDate;
	}

	public void setCreate_date(Date create_date) {
		this.createDate = create_date;
	}

	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", text=" + text + ", post=" + post + ", authorName=" + authorName
				+ ", create_date=" + createDate + "]";
	}
	
	
	
}
