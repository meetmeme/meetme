package com.meet.me.controller;

import java.util.List;

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
import com.meet.me.domain.User_interests;
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
	public ModelAndView mprofile(
			HttpSession session, 
			ModelAndView mv, 
			HttpServletRequest request) throws Exception{
		
		String user_id = (String)session.getAttribute("user_id1");
		int user_num = (int) session.getAttribute("user_num1");
		MyHome mhinfo = mhservice.getinfo(user_id);
		User userinfo = userservice.user_info(user_id);
		List<User_interests> user_interests = userservice.getInterestsNums(user_num);

		for(User_interests u : user_interests)
			System.out.println(u);

		if(mhinfo==null||userinfo==null) {
			System.out.println("정보 수집 실패");
		}else {
			System.out.println("정보 수집 성공");
			mv.setViewName("myhome/mprofile");
			mv.addObject("mhinfo", mhinfo);
			mv.addObject("userinfo", userinfo);
			mv.addObject("user_interests", user_interests);
		}
		return mv;
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
