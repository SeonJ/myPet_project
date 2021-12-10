package com.project.myPet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "memInfo", method = RequestMethod.GET)
	public String memInfo() {
		
		log.info("memInfo controller");
		
		return "/memberA/memInfo";
	}
	
	@RequestMapping(value = "memInfo_Action", method = RequestMethod.GET)
	public String memInfoAction(@RequestParam("memEmail") String memEmail,
						  		@RequestParam("pw") String pw,
						  		HttpSession session, 
						  		Model model) {
		
		log.info("memInfo Controller");
		
		log.info("memEmail : " + memEmail);
		
		MemberDTO member = memberService.getMember(memEmail);
		
		log.info("조회된 회원 정보 : " + member);
		
		return "/memberA/memInfo";
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
	
	
	
	
	
}
