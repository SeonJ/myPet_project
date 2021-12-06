/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 예약 DTO
 * 
 * @author project
 *
 */
public class ReserveDTO {

	/** 예약 번호 */
	private int reserveNum;
	
	/** 사용 시간 */
	private double useTime;
	
	/** 담당시터 */
	private String sitEmail;
	
	/** 회원(보호자) */
	private String memEmail;
	
	/** 강아지 이름 */
	private String dogs;
	
	/** 지역 */
	private String area;
	
	/** 예약 날짜 */
	private String careDate;
	
	/** 시작 시간 */
	private int startTime;
	
	/** 활동 */
	private String cares;
	
	/** 예약 시간 */
	private Timestamp reg;
	
	/** 승인 여부 */
	private String approve;
	
	/** 강아지 마리수 */
	private int dogsNum;

	public int getReserveNum() {
		return reserveNum;
	}

	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
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

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

	public int getDogsNum() {
		return dogsNum;
	}

	public void setDogsNum(int dogsNum) {
		this.dogsNum = dogsNum;
	}

	@Override
	public String toString() {
		return "ReserveDTO [reserveNum=" + reserveNum + ", useTime=" + useTime + ", sitEmail=" + sitEmail
				+ ", memEmail=" + memEmail + ", dogs=" + dogs + ", area=" + area + ", careDate=" + careDate
				+ ", startTime=" + startTime + ", cares=" + cares + ", reg=" + reg + ", approve=" + approve
				+ ", dogsNum=" + dogsNum + "]";
	}
	
}
