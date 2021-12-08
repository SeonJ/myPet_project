/**
 * 
 */
package com.project.myPet.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.myPet.domain.DogDTO;

/**
 * 강아지 관리 DAO
 * 
 * @author project
 *
 */
@Repository
public class DogDAO {

	private static final Logger log 
		= LoggerFactory.getLogger(DogDAO.class);
	
	private static final String MAPPER_NS = "com.project.myPet.mapper.Dog-mapper";
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 강아지 정보 생성
	 * 
	 * @param dog 강이지 정보
	 */
	public void insertDog(DogDTO dogDTO) {
		
		log.info("DogDAO.insertDog : " + dogDTO);
		sqlSession.insert(MAPPER_NS + ".insertDog", dogDTO);
	}
	
	/**
	 * 강아지 프로필 리스트 조회
	 * 
	 * @param email 주인 이메일
	 * @return 강아지 정보
	 */
	public DogDTO getDogList(String memEmail) {
		
		log.info("DogDAO.getDogList");
		return sqlSession.selectOne(MAPPER_NS + ".getDogList", memEmail);
	}
	
	/**
	 * 강아지 프로필 가져오기
	 * 
	 * @param dogNum 강아지 고유번호
	 * @return 강아지 정보
	 */
	public DogDTO getDogInfo(int dogNum) {
		
		log.info("DogDAO.getDogInfo");
		
		return sqlSession.selectOne(MAPPER_NS + ".getDogINfo", dogNum);
	}
	
	/**
	 * 강아지 프로필 수정
	 * 
	 * @param dogDTO 강아지 정보
	 */
	public void updateDogInfo(DogDTO dogDTO) {
		
		log.info("DogDAO.updateDogInfo");
		
		sqlSession.update(MAPPER_NS + ".updateDogInfo", dogDTO);
	}
	
	/**
	 * 반려견 프로필 삭제
	 * 
	 * @param DogNum 강아지 고유번호
	 */
	public void deleteDogInfo(int DogNum) {
		
		log.info("DogDAO.deleteDogInfo");
		
		sqlSession.delete(MAPPER_NS + ".deleteDogInfo", DogNum);
	}
	
	/**
	 * 회원 강아지 프로필리스트에 강아지 갯수
	 * 
	 * @param memEmail 주인 이메일
	 * @return 강아지 프로필 갯수
	 */
	public int getDogCount(String memEmail) {
		
		log.info("DogDAO.getDogCount");
		
		return sqlSession.selectOne(MAPPER_NS + ".getDogCount", memEmail);
	}
	
	/**
	 * 주인 회원 탈퇴시 등록되어있는 강이지(목록) 삭제
	 * 
	 * @param memEmail 주인 이메일
	 */
	public void memDeleteDogInfo(String memEmail) {
		
		log.info("DogDAO.memDeleteDogInfo");
		
		sqlSession.delete(MAPPER_NS + ".memDeleteDogInfo", memEmail);
	}
}
