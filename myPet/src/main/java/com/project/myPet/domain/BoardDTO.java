/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 커뮤니티 DTO
 * 
 * @author project
 *
 */
public class BoardDTO {

	/** 게시글 번호 */
	private int articleNum;
	
	/** 작성자 이메일 */
	private String email;
	
	/** 작성자 닉네임 */
	private String name;
	
	/** 제목 */
	private String subject;
	
	/** 내용 */
	private String content;
	
	/** 조회수 */
	private int readcount;
	
	/** 작성 시간 */
	private Timestamp reg;

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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	@Override
	public String toString() {
		return "BoardDTO [articleNum=" + articleNum + ", email=" + email + ", name=" + name + ", subject=" + subject
				+ ", content=" + content + ", readcount=" + readcount + ", reg=" + reg + "]";
	}
	
}
