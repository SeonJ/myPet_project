/**
 * 
 */
package com.project.myPet.domain;

import java.sql.Timestamp;

/**
 * 쪽지 DTO
 * 
 * @author project
 *
 */
public class NoteDTO {

	/** 쪽지 번호 */
	private int noteNum;
	
	/** 보낸 사람 */
	private String sender;
	
	/** 받는 사람 */
	private String recipient;
	
	/** 제목 */
	private String subject;
	
	/** 내용 */
	private String content;
	
	/** 조회수 */
	private int readcount;
	
	/** 보낸 시각 */
	private Timestamp reg;

	public int getNoteNum() {
		return noteNum;
	}

	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
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
		return "NoteDTO [noteNum=" + noteNum + ", sender=" + sender + ", recipient=" + recipient + ", subject="
				+ subject + ", content=" + content + ", readcount=" + readcount + ", reg=" + reg + "]";
	}
	
}
