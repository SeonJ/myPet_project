/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 댓글 DTO
 * 
 * @author project
 *
 */
public class ReplyDTO {

	/** 댓글 번호 */
	private int replyNum;
	
	/** 게시글 번호 */
	private int articleNum;
	
	/** 작성자 이메일 */
	private String email;
	
	/** 작성자 이름 */
	private String name;
	
	/** 댓글 내용 */
	private String content;
	
	/** 작성 시간 */
	private Timestamp reg;

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	@Override
	public String toString() {
		return "ReplyDTO [replyNum=" + replyNum + ", articleNum=" + articleNum + ", email=" + email + ", name=" + name
				+ ", content=" + content + ", reg=" + reg + "]";
	}
	
}
