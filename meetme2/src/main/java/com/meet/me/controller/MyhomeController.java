package com.meet.me.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;
import com.meet.me.service.MyHomeService;
import com.meet.me.service.UserService;

@Controller
public class MyhomeController {
	
	@Autowired
	MyHomeService mhservice;
	
	@Autowired
	UserService userservice;
	
	@RequestMapping(value = "/mmain.mh", method = RequestMethod.GET)
	public ModelAndView mmain(
			HttpSession session, 
			ModelAndView mv, 
			HttpServletRequest request) throws Exception{
		
		String user_id = (String)session.getAttribute("user_id1");
		MyHome mhinfo = mhservice.getinfo(user_id);
		User userinfo = userservice.user_info(user_id);
		if(mhinfo==null||userinfo==null) {
			System.out.println("정보 수집 실패");
		}else {
			System.out.println("정보 수집 성공");
			mv.setViewName("myhome/mmain");
			mv.addObject("mhinfo", mhinfo);
			mv.addObject("userinfo", userinfo);
		}
		return mv;
	}

	@RequestMapping(value = "/mprofile.mh", method = RequestMethod.GET)
	public String mprofile() {
		return "myhome/mprofile";
	}
	
	@RequestMapping(value = "/mevent.mh", method = RequestMethod.GET)
	public String mevent() {
		return "myhome/mevent";
	}
	
	@RequestMapping(value = "/mboard.mh", method = RequestMethod.GET)
	public String mboard() {
		return "myhome/mboard";
	}
}
