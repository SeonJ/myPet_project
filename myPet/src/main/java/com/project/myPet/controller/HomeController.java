package com.project.myPet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myPet.domain.MemberDTO;
import com.project.myPet.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberService memberService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("login.", locale);
		
		
		return "login";
	}
	
	@RequestMapping(value = "/registor", method = RequestMethod.GET)
	public String registor(Locale locale, Model model) {
		
		logger.info("registor.", locale);
		
		return "registor";
	}
	
	@RequestMapping(value = "/registor_action", method = RequestMethod.POST)
	public String registorAction(MemberDTO member, 
								 Model model, 
								 RedirectAttributes ra) {
		
		logger.info("registorAction");
		logger.info("회원 정보" + member);
		
		boolean flag = memberService.insertMem(member);
		String msg = flag == true ? "회원 정보 저장에 성공하였습니다" 
				: "회원 정보 저장에 실패하였습니다";
		
		logger.info("msg : " + msg);
		
		ra.addFlashAttribute("msg", msg);
		
		return "login";
	}
	
	
	
	
	
	
}
