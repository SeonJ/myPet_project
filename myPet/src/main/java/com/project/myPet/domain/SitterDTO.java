/**
 * 
 */
package com.project.myPet.domain;

/**
 * 시터 DTO
 * @author project
 *
 */
public class SitterDTO {

	/** 시터 이메일 */
	private String sitEmail;
	
	/** 비밀번호 */
	private String pw;
	
	/** 사진 */
	private String photo;
	
	/** 이름 */
	private String name;
	
	/** 성별 */
	private String gender;
	
	/** 연락처 */
	private String phone;
	
	/** 주소 */
	private String address;
	
	/** 활동지역 */
	private String workarea;
	
	/** 이력서 */
	private String resume;
	
	/** 휴가여부 */
	private String vacation;
	
	/** 활동상태 */
	private String state;

	public String getSitEmail() {
		return sitEmail;
	}

	public void setSitEmail(String sitEmail) {
		this.sitEmail = sitEmail;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWorkarea() {
		return workarea;
	}

	public void setWorkarea(String workarea) {
		this.workarea = workarea;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getVacation() {
		return vacation;
	}

	public void setVacation(String vacation) {
		this.vacation = vacation;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "SitterDTO [sitEmail=" + sitEmail + ", pw=" + pw + ", photo=" + photo + ", name=" + name + ", gender="
				+ gender + ", phone=" + phone + ", address=" + address + ", workarea=" + workarea + ", resume=" + resume
				+ ", vacation=" + vacation + ", state=" + state + "]";
	}
	
}
