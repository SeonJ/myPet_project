package com.project.myPet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.myPet.domain.DogDTO;
import com.project.myPet.domain.MemberDTO;
import com.project.myPet.service.DogService;
import com.project.myPet.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="memberA")
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	DogService dogService;
	
	@Autowired
	MemberService memberService;
	
	
	/**
	 * 마이 페이지 이동
	 * @param locale
	 * @param model
	 * @return 마이페이지 폼
	 */
	@RequestMapping(value = "memInfo")
	public String memInfo(Locale locale, Model model) {
		
		log.info("memInfo.", locale);
		
		return "/memberA/memInfo";
	}

	/**
	 * 마이페이지 ajax 데이터 전송 액션
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "memInfo_action" , produces = "application/text; charset=utf8")
	public String memInfoAction(
						  		HttpSession session, 
						  		Model model) {
		
		log.info("memInfoAction Controller");
		
		JSONObject resultData = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		boolean flag = session.getAttribute("SESS_LOGIN_INFO") != null ? true : false;
		
		
//		if(flag == true) {
//			log.info("aaaaa");
			String memEmail = ((MemberDTO)session.getAttribute("SESS_LOGIN_INFO")).getMemEmail();
			
//			
			
			try {
				
				MemberDTO member = memberService.getMember(memEmail);
//				MemberDTO member = new MemberDTO();
//				
//				member.setMemEmail("eunji");
//				member.setName("이은지");
//				member.setPhone("01091098751");
				
				log.info("조회된 회원 정보 : " + member);
				
				
				String memString = mapper.writeValueAsString(member);
				
				
				resultData.put("member",memString);
				resultData.put("result","success");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
//		} else {
//			resultData.put("result","fail");
//		}
		
		return resultData.toJSONString();
	}

	/**
	 * 회원 정보 수정 페이지 이동
	 * 
	 * @param session
	 * @param request
	 * @param model
	 * @return 수정페이지 폼
	 */
	@RequestMapping("/memUpdateInfo")
	public String memUpdateInfo(HttpSession session, 
							    HttpServletRequest request,
							    Model model) {
		
		return "/memberA/memUpdateInfo";
	}
	
	/**
	 * 회원 정보 수정 페이지에 회원 정보 데이터 전송 액션
	 * 
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/update_form", produces = "application/text; charset=utf8")
	public String updateForm(HttpSession session, 
							 HttpServletRequest request,
							 Model model) {
		
		log.info("updateForm Controller");
		
		JSONObject resultData = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		boolean flag = session.getAttribute("SESS_LOGIN_INFO") != null ? true : false;
		
		
//		if(flag == true) {
			log.info("bbbb");
			String memEmail = ((MemberDTO)session.getAttribute("SESS_LOGIN_INFO")).getMemEmail();
			
//			
			
			try {
				
				MemberDTO member = memberService.getMember(memEmail);
//				MemberDTO member = new MemberDTO();
//				
//				member.setMemEmail("eunji");
//				member.setName("이은지");
//				member.setPhone("01091098751");
				
				log.info("조회된 회원 정보 : " + member);
				
				
				String memString = mapper.writeValueAsString(member);
				
				
				resultData.put("member",memString);
				resultData.put("result","success");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
//		} else {
//			resultData.put("result","fail");
//		}
		
		return resultData.toJSONString();
	}
	
	/**
	 * 회원 정보 수정 액션
	 * 
	 * @param pw 수정될 비밀번호
	 * @param photo 수정될 사진
	 * @param phone 수정될 연락처
	 * @param address 수정될 주소
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update_memInfo")
	public String updateMemInfo(@RequestParam("pw") String pw, 
								@RequestParam("photo") String photo,
								@RequestParam("phone") String phone, 
								@RequestParam("address") String address, 
								HttpSession session, 
							    HttpServletRequest request,
							    Model model) {
		
		log.info("updateMemInfo Controller");
		JSONObject resultData = new JSONObject();
		
		MemberDTO member = new MemberDTO();
		member = (MemberDTO)session.getAttribute("SESS_LOGIN_INFO");
		member.setPw(pw);
		member.setPhoto(photo);
		member.setPhone(phone);
		member.setAddress(address);
		
		log.info("수정될 정보" + member);
		
		boolean flag = memberService.updateMemInfo(member);
		
		if(flag == true){
			resultData.put("result","success");
		}else {
			resultData.put("result","fail");
		}
		
		return resultData.toJSONString();
	}
	
	/**
	 * 회원 정보 삭제 액션
	 * 
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteMem_action")
	public String deleteMemAction(HttpSession session, 
								  HttpServletRequest request,
								  Model model) {
		
		log.info("deleteMemAction");
		
		JSONObject resultData = new JSONObject();
		
		boolean flag = session.getAttribute("SESS_LOGIN_INFO") != null ? true : false;
		
//		if(flag == true) {
			String memEmail = ((MemberDTO)session.getAttribute("SESS_LOGIN_INFO")).getMemEmail();
			
			try {
				memberService.deleteMem(memEmail);
				session.invalidate();
				
				resultData.put("result","success");
			} catch (Exception e) {
				e.printStackTrace();
			}
//		} else {
//			resultData.put("result","fail");
//		}
		
		return resultData.toJSONString();
	}
	
	/**
	 * 강아지 개별 정보
	 * 
	 * @param dogNum 강아지 고유번호
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "dogInfo", method = RequestMethod.GET)
	public String dogInfo(@RequestParam("dogNum") int dogNum, 
						  Model model) {
		log.info("dogInfo Controller");
		
		DogDTO dogDTO = dogService.getDogInfo(dogNum);
		
		model.addAttribute("dog", dogDTO);
		
		return "/memberA/dogInfo";
	}
	
	/**
	 * 강아지 프로필 리스트 폼 이동
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "myDogList", method = RequestMethod.GET)
	public String myDogList(Locale locale, Model model) {
		log.info("myDogList.", locale);
		
		
		return "/memberA/myDogList";
	}
	
	/**
	 * 강아지 프로필 리스트 액션
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "myDogList_action", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String myDogList_action(HttpSession session, 
							Model model) {
		
		log.info("myDogList Controller");
		
		List<DogDTO> list = null; //dto타입으로 리스트 만들어주기
	      
	    JSONObject resultData = new JSONObject();
	    JSONArray listDataJArray = new JSONArray();
	    JSONParser jsonParser = new JSONParser();
	    ObjectMapper mapper = new ObjectMapper(); 
	    String jsonList="";

	    String memEmail = ((MemberDTO)session.getAttribute("SESS_LOGIN_INFO")).getMemEmail();
	    try {
	         
	         
	         list = dogService.getDogList(memEmail); // 쿼리에서 불러온 강아지 목록 리스트에 담아주기 
	         
	         jsonList = mapper.writeValueAsString(list);
	         
	         
	         resultData.put("dogList", jsonList);
	         resultData.put("result", "success");
	         
	    } catch (Exception e) {
	         e.printStackTrace();
	         resultData.put("result", "fail");
	    }
	    
	    return resultData.toJSONString();
	}
	
	/**
	 * 강아지 정보 등록 폼 이동
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insertMyDog", method = RequestMethod.GET)
	public String insertMyDog(HttpSession session, 
							  Model model) {
		
		log.info("insertMyDog");
		
		log.info("강아지 정보 등록 폼");
		
		
		return "/memberA/insertMyDog";
	}
	
	/**
	 * 강아지 정보 등록 액션
	 * 
	 * @param name 강아지 이름
	 * @param photo 강아지 사진
	 * @param weight 강아지 몸무게
	 * @param speices 강아지 견종
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/insertDog_action")
	public String insertDogAction(@RequestParam("name") String name, 
								  @RequestParam("photo") String photo,
								  @RequestParam("weight") String weight, 
								  @RequestParam("speices") String speices, 
								  HttpSession session, 
							      HttpServletRequest request,
							      Model model) {
		
		log.info("insertDogAction");
		
		JSONObject resultData = new JSONObject();
		String memEmail =((MemberDTO)session.getAttribute("SESS_LOGIN_INFO")).getMemEmail();
		
		DogDTO dogDTO = new DogDTO();
		dogDTO.setEmail(memEmail);
		dogDTO.setName(name);
		dogDTO.setPhoto(photo);
		dogDTO.setWeight(weight);
		dogDTO.setSpeices(speices);
		
		boolean flag = dogService.insertDog(dogDTO);
		
		if(flag == true) {
			resultData.put("result","success");
		} else {
			resultData.put("result","fail");
		}
		
		return resultData.toJSONString();
		
	}
	
	/**
	 * 강아지 정보 삭제 패쓰워드 입력 폼 이동
	 * 
	 * @param dogNum 강아지 고유번호
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "dogDeleteForm")
	public String dogDeleteForm(@RequestParam("dogNum") int dogNum,
								HttpSession session, 
							    Model model) {
		
		log.info("dogDeleteForm Controller");
		
		DogDTO dogDTO = dogService.getDogInfo(dogNum);
		
		model.addAttribute("dog", dogDTO);
		
		return "/memberA/dogDeleteForm";
	}
	
	/**
	 * 강아지 정보 삭제 패쓰워드 입력 액션
	 * 
	 * @param dogNum 강아지 고유번호
	 * @param pw 로그인된 이메일에 대한 패쓰워드
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delete_check_pass")
	public String deleteCheckPass(@RequestParam("dogNum") int dogNum,
								  @RequestParam("pw") String pw,
								  HttpSession session, 
								  Model model) {
		
		log.info("반려견 정보 삭제 패쓰워드 입력폼 처리");
		
		JSONObject resultData = new JSONObject();
		
		boolean flag = session.getAttribute("SESS_LOGIN_INFO") != null ? true : false;
		
		if(flag == true) {
			MemberDTO member = (MemberDTO)session.getAttribute("SESS_LOGIN_INFO");
			
			try {
				
				if (member.getPw().equals(pw)) { // 패쓰워드 일치
					log.info("11111");
					dogService.deleteDogInfo(dogNum);
					
					resultData.put("result","success");
					
				} else { // 패쓰워드 불일치
					log.info("22222");
					resultData.put("result","falsePw");
				} //
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			log.info("33333");
			resultData.put("result","fail");
		}
		
		return resultData.toJSONString();
	}
	
	
	/**
	 * 강아지 정보 수정 페이지 이동
	 * 
	 * @param dogNum 강아지 고유번호
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "dogUpdateInfo", method = RequestMethod.GET)
	public String dogUpdateInfo(@RequestParam("dogNum") int dogNum, 
								Model model) {
		log.info("dogUpdateInfo Controller");
		
		DogDTO dogDTO = dogService.getDogInfo(dogNum);
		
		model.addAttribute("dog", dogDTO);
		
		return "/memberA/dogUpdateInfo";
	}
	
	/**
	 * 강아지 정보 수정 액션
	 * 
	 * @param dogNum 강아지 고유번호
	 * @param name 수정될 이름
 	 * @param photo 수정될 사진
	 * @param weight 수정될 몸무게
	 * @param speices 수정될 견종
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update_dogInfo")
	public String updateDogInfo(@RequestParam("dogNum") int dogNum, 
								@RequestParam("name") String name,
								@RequestParam("photo") String photo,
								@RequestParam("weight") String weight, 
								@RequestParam("speices") String speices, 
								HttpSession session, 
							    HttpServletRequest request,
							    Model model) {
		
		log.info("updateDogInfo Controller");
		
		JSONObject resultData = new JSONObject();
		
		DogDTO dogDTO = new DogDTO();
		dogDTO.setDogNum(dogNum);
		dogDTO.setName(name);
		dogDTO.setPhoto(photo);
		dogDTO.setWeight(weight);
		dogDTO.setSpeices(speices);
		
		boolean flag = dogService.updateDogInfo(dogDTO);
		
		if(flag == true){
			resultData.put("result","success");
		}else {
			resultData.put("result","fail");
		}
		
		return resultData.toJSONString();
	}
	
	@RequestMapping(value = "purchaseTime", method = RequestMethod.GET)
	public String purchaseTime(Locale locale, Model model) {
		
		log.info("purchaseTime.", locale);
		
		return "/memberA/purchaseTime";
	}
	
}
