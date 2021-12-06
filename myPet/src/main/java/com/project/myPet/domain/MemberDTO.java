/**
 * 
 */
package com.project.myPet.domain;

/**
 * 회원 VO
 * 
 * @author project
 *
 */
public class MemberDTO {
	
	/** 회원 이메일 */
	private String memEmail;
	
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
	
	/** 이용권 잔여시간 */
	private double restTime;
	
	/** 활동 상태 */
	private String state;

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
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

	public double getRestTime() {
		return restTime;
	}

	public void setRestTime(double restTime) {
		this.restTime = restTime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "MemberDTO [memEmail=" + memEmail + ", pw=" + pw + ", photo=" + photo + ", name=" + name + ", gender="
				+ gender + ", phone=" + phone + ", address=" + address + ", restTime=" + restTime + ", state=" + state
				+ "]";
	}

}
