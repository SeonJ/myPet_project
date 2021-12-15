/**
 * 
 */
package com.project.myPet.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.project.myPet.dao.DogDAO;
import com.project.myPet.domain.DogDTO;

/**
 * 강아지 관리 서비스
 * 
 * @author project
 *
 */
@Service
public class DogService {

	private static final Logger log 
		= LoggerFactory.getLogger(DogService.class);
	
	@Autowired
	DogDAO dogDAO;
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	/**
	 * 강아지 정보 생성
	 * 
	 * @param dogDTO 강아지 정보
	 * @return 강아지 정보 생성 성공 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean insertDog(DogDTO dogDTO) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			dogDAO.insertDog(dogDTO);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("DogService.insert 저장 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 강아지 프로필 리스트 조회
	 * 
	 * @param email 주인 이메일
	 * @return 강아지 정보
	 */
	@Transactional(readOnly=true)
	public List<DogDTO> getDogList(String email) {
		
		List<DogDTO> dog = new ArrayList<DogDTO>();
		
		try {
			dog = dogDAO.getDogList(email);
			if (dog == null) {
				throw new Exception("DogService.getDogList 조회 에러");
			}
		} catch (Exception e) {
			log.error("DogService.getDogList 조회 에러");
			e.printStackTrace();
		}
		
		return dog;
	}
	
	/**
	 * 강아지 프로필 가져오기
	 * 
	 * @param dogNum 강아지 고유번호
	 * @return 강아지 정보
	 */
	@Transactional(readOnly=true)
	public DogDTO getDogINfo(int dogNum) {
		
		DogDTO dog = null;
		
		try {
			dog = dogDAO.getDogInfo(dogNum);
			if (dog == null) {
				throw new Exception("DogService.getDogInfo 조회 에러");
			}
		} catch (Exception e) {
			log.error("DogService.getDogInfo 조회 에러");
			e.printStackTrace();
		}
		
		return dog;
	}
	
	/**
	 * 강아지 프로필 수정
	 * 
	 * @param dogDTO 강아지 정보
	 * @return 강아지 프로필 수정 성공 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean updateDogInfo(DogDTO dogDTO) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			dogDAO.updateDogInfo(dogDTO);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("DogService.updateDogInfo 저장 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 반려견 프로필 삭제
	 * 
	 * @param DogNum 강아지 고유번호
	 * @return 반려견 프로필 삭제 성공 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean deleteDogInfo(int DogNum) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			dogDAO.deleteDogInfo(DogNum);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("DogService.deleteDogInfo 삭제 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 회원 강아지 프로필리스트에 강아지 갯수
	 * 
	 * @param memEmail 주인 이메일
	 * @return 강이지 프로필 갯수
	 */
	@Transactional(readOnly=true)
	public int getDogCount(String memEmail) {
		
		int result = 0;
		
		try {
			result = dogDAO.getDogCount(memEmail);
		} catch (Exception e) {
			log.error("DogService.getDogCount 조회 에러");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean memDeleteDogInfo(String memEmail) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			dogDAO.memDeleteDogInfo(memEmail);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("DogService.memDeleteDogInfo 삭제 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
}
