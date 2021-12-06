/**
 * 
 */
package com.project.myPet.domain;

/**
 * 강아지 DTO
 * 
 * @author project
 *
 */
public class DogDTO {

	/** 강아지 고유번호 */
	private int dogNum;
	
	/** 이름 */
	private String name;
	
	/** 사진 */
	private String photo;
	
	/** 주인 이메일 */
	private String email;
	
	/** 몸무게 */
	private String weight;
	
	/** 견종 */
	private String speices;

	public int getDogNum() {
		return dogNum;
	}

	public void setDogNum(int dogNum) {
		this.dogNum = dogNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getSpeices() {
		return speices;
	}

	public void setSpeices(String speices) {
		this.speices = speices;
	}

	@Override
	public String toString() {
		return "DogDTO [dogNum=" + dogNum + ", name=" + name + ", photo=" + photo + ", email=" + email + ", weight="
				+ weight + ", speices=" + speices + "]";
	}
	
}
