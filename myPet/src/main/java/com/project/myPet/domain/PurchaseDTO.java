/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 이용권 DTO
 * 
 * @author project
 *
 */
public class PurchaseDTO {

	/** 이용권 번호 */
	private int ticketNum;
	
	/** 이용권 */
	private double ticket;
	
	/** 구매자(보호자) */
	private String memEmail;
	
	/** 구매 신청기간 */
	private Timestamp reg;
	
	/** 결제 상태 */
	private String status;
	
	/** 환불 여부 */
	private String refund;
	
	/** 환불 일시 */
	private Timestamp refundTime;

	public int getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}

	public double getTicket() {
		return ticket;
	}

	public void setTicket(double ticket) {
		this.ticket = ticket;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}

	public Timestamp getRefundTime() {
		return refundTime;
	}

	public void setRefundTime(Timestamp refundTime) {
		this.refundTime = refundTime;
	}

	@Override
	public String toString() {
		return "PurchaseDTO [ticketNum=" + ticketNum + ", ticket=" + ticket + ", memEmail=" + memEmail + ", reg=" + reg
				+ ", status=" + status + ", refund=" + refund + ", refundTime=" + refundTime + "]";
	}
	
}
