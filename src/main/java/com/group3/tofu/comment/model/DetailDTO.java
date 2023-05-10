package com.group3.tofu.comment.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DetailDTO {

	@JsonProperty("msg")
    private String commentDetail;

    
    @JsonProperty("pageName")
	private String pageName;
    
    public DetailDTO() {
	}

    public String getCommentDetail() {
        return commentDetail;
    }

    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

    
}

