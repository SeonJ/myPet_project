/**
 * 
 */
package com.project.myPet.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.myPet.domain.MemberDTO;
import com.project.myPet.domain.PageDTO;
import com.project.myPet.domain.SearchVO;

/**
 * 회원 관리 DAO
 * 
 * @author project
 *
 */
@Repository
public class MemberDAO {

	private static final Logger log 
		= LoggerFactory.getLogger(MemberDAO.class);
	
	private static final String MAPPER_NS = "com.project.myPet.mapper.Member-mapper";
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원 정보 생성
	 * 
	 * @param member 회원 정보
	 */
	public void insertMem(MemberDTO member) {
		
		log.info("MemberDAO.insertMem : " + member);
		sqlSession.insert(MAPPER_NS + ".insertMem", member);
	}
	
	/**
	 * 회원 활동상태 확인
	 * 
	 * @param memEmail 회원 이메일
	 * @return state 회원 활동 상태
	 */
	public String memStateCheck(String memEmail) {
		
		log.info("MemberDAO.memStateCheck");
		
		return sqlSession.selectOne(MAPPER_NS + ".memStateCheck", memEmail);
	}
	
	/**
	 * 로그인 인증
	 * 
	 * @param memEmail  회원 이메일
	 * @param pw  회원 패쓰워드
	 * @return 로그인 메시지
	 *   ex) 존재하지 않는 회원입니다.
	 *   ex) 패쓰워드가 일치하지 않습니다.
	 *   ex) 로그인에 성공하였습니다.  
	 */
	public String memLoginCheck(String memEmail, String pw) {
		
		log.info("MemberDAO.memLoginCheck");
		String msg = "";
		
		MemberDTO member = null;
		
		boolean flag = this.isMember(memEmail);
		
		if (flag == true) { // 회원일 경우
			member = new MemberDTO();
			member.setMemEmail(memEmail);
			member.setPw(pw);
			msg = (int)(sqlSession.selectOne(MAPPER_NS + ".memLoginCheck"
					, member)) == 1 ? "로그인에 성공하였습니다." : "패쓰워드가 일치하지 않습니다.";
		} else { // 비회원일 경우
			msg = "존재하지 않는 회원입니다.";
		}
		
		return msg;
	}
	
	/**
	 * 회원 존재 여부 점검
	 * 
	 * @param id 회원 아이디
	 * @return 회원 존재 여부
	 * @throws SQLException
	 */
	public boolean isMember(String memEmail) {
		
		log.info("회원 존재 여부 점검");
		
		return (int)(sqlSession.selectOne(MAPPER_NS + ".isMember", memEmail)) == 1 ? 
				true : false;
	}
	
	/**
	 * 개별 회원 정보 조회
	 * 
	 * @param memEmail 회원 이메일
	 * @return 회원 정보
	 */
	public MemberDTO getMember(String memEmail) {
		
		log.info("MemberDAO.getMember");
		
		return sqlSession.selectOne(MAPPER_NS + ".getMember", memEmail);
	}
	
	
	/**
	 * 회원 정보 수정
	 * 
	 * @param memberDTO 강아지 정보
	 */
	public void updateMemInfo(MemberDTO memberDTO) {
		
		log.info("MemberDAO.updateMemInfo");
		
		sqlSession.update(MAPPER_NS + ".updateMemInfo", memberDTO);
	}
	
	/**
	 * 회원 정보 삭제
	 * 
	 * @param memEmail 회원 이메일
	 */
	public void deleteMem(String memEmail) {
		
		log.info("MemberDAO.deleteMem");
		
		sqlSession.delete(MAPPER_NS + ".deleteMem", memEmail);
	}
	
	/**
	 * 관리자 : 전체 회원 리스트(페이징)
	 * 
	 * @param pageDTO 페이징 DTO
	 * @return 페이지 별 회원 정보들
	 */
	public List<MemberDTO> getMemList(PageDTO pageDTO) {
		
		log.info("MemberDAO.getMemList");
		
		return sqlSession.selectList(MAPPER_NS + ".getMemList", pageDTO);
	}
	
	/**
	 * 관리자 : 마지막 페이지 구하기(조회) (페이징) : 전체 회원 조회
	 * 
	 * @param limit 페이지 당 인원수 (한계량)
	 * @return 마지막 (총) 페이지 구하기
	 */
	public int getLastPage(int limit) {
		
		log.info("MemberDAO.getLastPage");
		
		return sqlSession.selectOne(MAPPER_NS + ".getLastPage", limit);
	}
	
	/**
	 *  관리자 : 마지막 (총) 페이지 구하기(조회) : 회원 검색
	 * 
	 * @param searchVO 검색 VO
	 * @return 마지막 (총) 페이지
	 */
	public int getSearchLastPage(SearchVO searchVO) {
		
		log.info("MemberDAO.getSearchLastPage");
		return sqlSession.selectOne(MAPPER_NS + ".getSearchLastPage",searchVO);
	}
	
	/**
	 * 관리자 : 회원 검색 (이메일)
	 * 
	 * @param searchKind 검색구분
	 * @param searchWord 검색어
	 * @return 검색 결과(회원)
	 */
	public MemberDTO getMemberByEmail(String searchKind, String searchWord) {
		
		log.info("회원 검색 (이메일)");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchKind", searchKind);
		map.put("searchWord", searchWord);
		
		return sqlSession.selectOne(MAPPER_NS + ".getMemberByEmail"
							, map);
		
	}
	
	/**
	 * 관리자 : 회원 검색(이름/연락처)
	 * 
	 * @param searchVO 검색 VO
	 * @return 검색 결과(회원 정보들)
	 */
	public List<MemberDTO> getMembersByNameOrPhone(SearchVO searchVO) {
		
		log.info("회원 검색(이름/연락처)");
		return sqlSession.selectList(MAPPER_NS + ".getMembersByNameOrPhone"
						, searchVO);
	}
	
	/**
	 * 관리자 : 회원 활동 중지
	 * 
	 * @param memEmail 회원 이메일
	 */
	public void updateMemState(String memEmail) {
		
		log.info("MemberDAO.updateMemState");
		
		sqlSession.update(MAPPER_NS + ".updateMemState", memEmail);
	}
	
	/**
	 * 관리자 : 구매요청 승인하면 멤버테이블 restTime에 시간 플러스
	 * 
	 * @param memEmail 회원 이메일
	 */
	public void plusRestTime(String memEmail) {
		
		log.info("MemberDAO.plusRestTime");
		
		sqlSession.update(MAPPER_NS + ".plusRestTime", memEmail);
	}
}
