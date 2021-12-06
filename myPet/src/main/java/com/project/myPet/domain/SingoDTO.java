/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 신고 게시글 DTO
 * 
 * @author project
 *
 */
public class SingoDTO {

	/** 신고 번호 */
	private int singoNum;
	
	/** 신고 대상 */
	private String singoDangHam;
	
	/** 신고 작성자 */
	private String singoHam;
	
	/** 직업 */
	private String job;
	
	/** 내용 */
	private String content;
	
	/** 작성 일시 */
	private Timestamp reg;

	public int getSingoNum() {
		return singoNum;
	}

	public void setSingoNum(int singoNum) {
		this.singoNum = singoNum;
	}

	public String getSingoDangHam() {
		return singoDangHam;
	}

	public void setSingoDangHam(String singoDangHam) {
		this.singoDangHam = singoDangHam;
	}

	public String getSingoHam() {
		return singoHam;
	}

	public void setSingoHam(String singoHam) {
		this.singoHam = singoHam;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
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
		return "SingoDTO [singoNum=" + singoNum + ", singoDangHam=" + singoDangHam + ", singoHam=" + singoHam + ", job="
				+ job + ", content=" + content + ", reg=" + reg + "]";
	}
	
}
