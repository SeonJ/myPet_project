/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 활동 DTO
 * 
 * @author project
 *
 */
public class CareDTO {

	/** 활동 번호 */
	private int careNum;
	
	/** 사용 시간 */
	private double useTime;
	
	/** 담당 시터 */
	private String sitEmail;
	
	/** 회원(보호자) */
	private String memEmail;
	
	/** 강아지들 */
	private String dogs;
	
	/** 지역 */
	private String area;
	
	/** 활동 날짜 */
	private String careDate;
	
	/** 시작 시간 */
	private int startTime;
	
	/** 활동 */
	private String cares;
	
	/** 후기 */
	private String review;
	
	/** 돌봄일지 */
	private String careDiary;
	
	/** 돌봄일지 사진 */
	private String photo;
	
	/** 예약 시간 */
	private Timestamp reg;

	public int getCareNum() {
		return careNum;
	}

	public void setCareNum(int careNum) {
		this.careNum = careNum;
	}

	public double getUseTime() {
		return useTime;
	}

	public void setUseTime(double useTime) {
		this.useTime = useTime;
	}

	public String getSitEmail() {
		return sitEmail;
	}

	public void setSitEmail(String sitEmail) {
		this.sitEmail = sitEmail;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getDogs() {
		return dogs;
	}

	public void setDogs(String dogs) {
		this.dogs = dogs;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCareDate() {
		return careDate;
	}

	public void setCareDate(String careDate) {
		this.careDate = careDate;
	}

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public String getCares() {
		return cares;
	}

	public void setCares(String cares) {
		this.cares = cares;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getCareDiary() {
		return careDiary;
	}

	public void setCareDiary(String careDiary) {
		this.careDiary = careDiary;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	@Override
	public String toString() {
		return "CareDTO [careNum=" + careNum + ", useTime=" + useTime + ", sitEmail=" + sitEmail + ", memEmail="
				+ memEmail + ", dogs=" + dogs + ", area=" + area + ", careDate=" + careDate + ", startTime=" + startTime
				+ ", cares=" + cares + ", review=" + review + ", careDiary=" + careDiary + ", photo=" + photo + ", reg="
				+ reg + "]";
	}
	
}
