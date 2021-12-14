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

import com.project.myPet.dao.MemberDAO;
import com.project.myPet.domain.MemberDTO;
import com.project.myPet.domain.PageDTO;
import com.project.myPet.domain.SearchVO;

/**
 * 회원 관리 서비스
 * 
 * @author project
 *
 */
@Service
public class MemberService {

	private static final Logger log 
		= LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	/**
	 * 회원 정보 생성
	 * 
	 * @param memberDTO 회언 정보
	 * @return 회원 정보 생성 성공 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean insertMem(MemberDTO member) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			memberDAO.insertMem(member);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("MemberService.insert 저장 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 회원 활동상태 확인
	 * 
	 * @param memEmail 회원 이메일
	 * @return state 회원 활동 상태
	 */
	@Transactional(readOnly=true)
	public String memStateCheck(String memEmail) {
		
		String state = "";
		
		try {
			state = memberDAO.memStateCheck(memEmail);
			if (state == null) {
				throw new Exception("MemberService.memStateCheck 확인 에러");
			}
		} catch (Exception e) {
			log.error("MemberService.memStateCheck 확인 에러");
			e.printStackTrace();
		}
		
		return state;
	}
	
	/**
	 * 로그인 인증 점검
	 * 
	 * @param memEmail 회원 이메일
	 * @param pw 회원 패쓰워드
	 * @return 로그인 메시지 
	 *   ex) 존재하지 않는 회원입니다.
	 *   ex) 패쓰워드가 일치하지 않습니다.
	 *   ex) 로그인에 성공하였습니다.  
	 */
	@Transactional(readOnly=true)
	public String memLoginCheck(String memEmail, String pw) {
		
		log.info("MemberService.memLoginCheck");
		String msg = "";
		
		try {
			msg = memberDAO.memLoginCheck(memEmail, pw);
		} catch (Exception e) {
			log.error("MemberService.memLoginCheck 조회 에러");
			e.printStackTrace();
		}
		
		return msg;
	}
	
	/**
	 * 개별 회원 정보 조회
	 * 
	 * @param memEmail 회원 이메일
	 * @return 회원 정보
	 */
	@Transactional(readOnly=true)
	public MemberDTO getMember(String memEmail) {
		
		MemberDTO member = null;
		
		try {
			member = memberDAO.getMember(memEmail);
			if (member == null) {
				throw new Exception("MemberService.getMember 조회 에러");
			}
		} catch (Exception e) {
			log.error("MemberService.getMember 조회 에러");
			e.printStackTrace();
		}
		
		return member;
	}
	
	/**
	 * 회원 정보 수정
	 * 
	 * @param memberDTO 강아지 정보
	 * @return 회원 정보 수정 성공 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean updateMemInfo(MemberDTO memberDTO) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			memberDAO.updateMemInfo(memberDTO);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("MemberService.updateMemInfo 저장 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 회원 정보 삭제
	 * 
	 * @param memEmail 회원 이메일
	 * @return 회원 정보 삭제 성공 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean deleteMem(String memEmail) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			memberDAO.deleteMem(memEmail);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("MemberService.deleteMem 삭제 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 전체 회원 정보 조회(페이징)
	 * 
	 * @param pageDTO 페이징 DTO
	 * @return 페이지별 회원 정보들
	 */
	@Transactional(readOnly=true)
	public List<MemberDTO> getMemList(PageDTO pageDTO) {
		
		List<MemberDTO> members = null;
		
		try {
			members = memberDAO.getMemList(pageDTO);
			if (members == null) {
				throw new Exception("MemberService.getMemList 조회 에러");
			}
		} catch (Exception e) {
			log.error("MemberService.getMemList 조회 에러");
			e.printStackTrace();
		}
		
		return members;
	}
	
	/**
	 * 마지막(총) 페이지 구하기(조회) : 전체 회원 조회
	 * 
	 * @param limit 페이지당 인원수(한계량)
	 * @return 마지막(총) 페이지
	 */
	@Transactional(readOnly=true)
	public int getLastPage(int limit) {
		
		int result = 0;
	
		try {
			result = memberDAO.getLastPage(limit);
		} catch (Exception e) {
			log.error("MemberService.getLastPage 조회 에러");
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 마지막(총) 페이지 구하기(조회) : 회원 검색
	 * 
	 * @param searchVO 검색 VO
	 * @return 마지막(총) 페이지
	 */
	@Transactional(readOnly=true)
	public int getSearchLastPage(SearchVO searchVO) {
		
		int result = 0;
	
		try {
			result = memberDAO.getSearchLastPage(searchVO);
		} catch (Exception e) {
			log.error("MemberService.getSearchLastPage 조회 에러");
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 회원 검색
	 * 
	 * @param searchVO 검색 VO 
	 * 		ex) 검색 구분 : 이메일 (동등검색) / 이름, 연락처 (유사 검색)
	 * @return 검색 결과 (회원 정보)
	 */
	@Transactional(readOnly=true)
	public List<MemberDTO> findBySearching(SearchVO searchVO) {
		
		log.info("MemberService.findBySearching");
		
		List<MemberDTO> members = new ArrayList<>();
		
		// 검색 구분 : 이메일 (동등검색) / 이름, 연락처 (유사 검색)
		String searchKind = searchVO.getSearchKind();
		String searchWord = searchVO.getSearchWord();

		// 이메일 (동등 검색)
		if (searchKind.contentEquals("memEmail")) {
			
			members.add(memberDAO.getMemberByEmail(searchKind, searchWord));
			
		} else { // 이름, 연락처 (유사 검색)
			
			members = memberDAO.getMembersByNameOrPhone(searchVO);
		} //
		
		return members;
	}
	
	/**
	 * 관리자 : 회원 활동 중지
	 * 
	 * @param memEmail 회원 이메일
	 * @return state 회원활동 수정 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean updateMemState(String memEmail) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			memberDAO.updateMemState(memEmail);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("MemberService.updateMemState 저장 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 관리자 : 구매요청 승인하면 멤버테이블 restTime에 시간 플러스
	 * 
	 * @param memEmail 회원 이메일
	 * @return restTime 이용권 시간 플러스 수정 여부
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean plusRestTime(String memEmail) {
		
		boolean flag = false;
		TransactionStatus txStatus
				= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			memberDAO.plusRestTime(memEmail);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error("MemberService.plusRestTime 수정 에러");
			e.printStackTrace();
		}
		
		return flag;
	}
}
