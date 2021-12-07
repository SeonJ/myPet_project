package com.project.myPet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="memberA")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping(value = "dogInfo", method = RequestMethod.GET)
	public String dogInfo(Locale locale, Model model) {
		logger.info("dogInfo.", locale);
		
		
		
		
		return "/memberA/dogInfo";
	}
	
	
	@RequestMapping(value = "memInfo", method = RequestMethod.GET)
	public String memInfo(Locale locale, Model model) {
		logger.info("memInfo.", locale);
		
		
		return "/memberA/memInfo";
	}
	
	@RequestMapping(value = "myDogList", method = RequestMethod.GET)
	public String myDogList(Locale locale, Model model) {
		logger.info("myDogList", locale);
		
		
		
		
		return "/memberA/myDogList";
	}
	
	
	
	@RequestMapping(value = "insertMyDog", method = RequestMethod.GET)
	public String insertMyDog(Locale locale, Model model, @RequestParam("email") String email) {
		logger.info("insertMyDog", locale);
		
		
		
		
		return "";
	}
	
	
	
	
	
}
