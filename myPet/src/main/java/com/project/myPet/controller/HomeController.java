package com.project.myPet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myPet.domain.MemberDTO;
import com.project.myPet.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberService memberService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		log.info("login");
		
		// 세션 여부 확인 후 -> 세션O : home   ,   세션X : login
		return session.getAttribute("SESS_LOGIN_INFO") != null ? 
				"home" : "login";
	}
	
	@ResponseBody
	@RequestMapping("/login_action")
	public String loginAction(@RequestParam("memEmail") String memEmail,
							  @RequestParam("pw") String pw, 
							  HttpSession session, HttpServletRequest request,Model model) {
		
		log.info("loginAction");
		
		log.info("아이디 : " + memEmail);
		log.info("비밀번호 : " + pw);
		
		JSONObject result = new JSONObject();
		String msg = "";
		MemberDTO member = null;
		String forwardPage = "";
		
		msg = memberService.memLoginCheck(memEmail, pw);
		
		if (msg.equals("로그인에 성공하였습니다.")) {
			
				// 세션 생성
				session = request.getSession(false);
			
				MemberDTO sessionVO = new MemberDTO();
				member = memberService.getMember(memEmail);
				
				sessionVO.setMemEmail(member.getMemEmail());
				sessionVO.setPw(member.getPw());
				sessionVO.setName(member.getName());
				sessionVO.setGender(member.getGender());
				sessionVO.setPhone(member.getPhone());
				sessionVO.setAddress(member.getAddress());
				sessionVO.setRestTime(member.getRestTime());
				sessionVO.setState(member.getState());
				session.setAttribute("SESS_LOGIN_INFO", sessionVO);
				
				log.info("sessionVo : " + sessionVO);
				
				result.put("result","success");
//				forwardPage = "redirect:/";
		} else if (msg.equals("패쓰워드가 일치하지 않습니다.")) {  // 비밀번호 실패
//			forwardPage = "redirect:/login";
//			model.addAttribute("msg", msg);
			
			result.put("result","fail");
			
		} else {  // 비회원
//			forwardPage = "redirect:/registor";
			result.put("result","fail");
		}
		
		return result.toJSONString();
	}
	
	@RequestMapping(value = "/registor", method = RequestMethod.GET)
	public String registor(Locale locale, Model model) {
		
		log.info("registor.", locale);
		
		return "registor";
	}
	
	@ResponseBody
	@RequestMapping(value = "/registor_action", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public String registorAction(
								 MemberDTO member,
								 Model model, 
								 RedirectAttributes ra) {
		
		log.info("registorAction");
		log.info("회원 정보 : " + member);
		
		JSONObject resultData = new JSONObject();
		boolean flag = memberService.insertMem(member);
		String msg = flag == true ? "회원 정보 저장에 성공하였습니다" 
				: "회원 정보 저장에 실패하였습니다";
		
		if(flag == true){
			resultData.put("result","success");
			resultData.put("msg",msg);
		}else {
			resultData.put("result","fail");
			resultData.put("msg",msg);
		}
		
		
		log.info("msg : " + msg);
		
//		ra.addFlashAttribute("msg", msg);
		
		return resultData.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping("/logout_action")
	public String logoutAction(HttpSession session, 
							   HttpServletRequest request,
							   Model model) {
		
		log.info("logoutAction");
		
		JSONObject resultData = new JSONObject();
		
		boolean flag = session.getAttribute("SESS_LOGIN_INFO") != null ? true : false;
		
		if(flag == true) {
			session.invalidate();
			resultData.put("result","success");
		} else {
			resultData.put("result","fail");
		}
		
		return resultData.toJSONString();
	}
	
	
	
	
}
