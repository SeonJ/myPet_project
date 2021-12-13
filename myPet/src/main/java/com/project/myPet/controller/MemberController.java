package com.project.myPet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	
	
	@RequestMapping(value = "dogInfo", method = RequestMethod.GET)
	public String dogInfo(Locale locale, Model model) {
		log.info("dogInfo.", locale);
		
		
		
		
		return "/memberA/dogInfo";
	}
	
	@RequestMapping(value = "memInfo")
	public String memInfo(Locale locale, Model model) {
		
		log.info("memInfo.", locale);
		
		return "/memberA/memInfo";
	}


	@ResponseBody
	@RequestMapping(value = "memInfo_action")
	public String memInfoAction(
						  		HttpSession session, 
						  		Model model) {
		
		log.info("memInfoAction Controller");
		
		JSONObject resultData = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		boolean flag = session.getAttribute("SESS_LOGIN_INFO") != null ? true : false;
		
		
//		if(flag == true) {
			log.info("aaaaa");
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
	
	@RequestMapping(value = "myDogList", method = RequestMethod.GET)
	public String myDogList(Locale locale, Model model) {
		log.info("myDogList", locale);
		
		
		
		
		return "/memberA/myDogList";
	}
	
	
	
	@RequestMapping(value = "insertMyDog", method = RequestMethod.GET)
	public String insertMyDog(Locale locale, Model model, @RequestParam("email") String email) {
		
		log.info("insertMyDog", locale);
		
		log.info("강아지 정보 등록 폼");
		
		
		
		return "";
	}
	
	@RequestMapping("/memUpdateInfo")
	public String memUpdateInfo(HttpSession session, 
							    HttpServletRequest request,
							    Model model) {
		
		return "/memberA/memUpdateInfo";
	}
	
	@ResponseBody
	@RequestMapping("/update_memInfo")
	public String updateMemInfo(HttpSession session, 
							    HttpServletRequest request,
							    Model model) {
		
		return "";
	}
	
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
	
}
