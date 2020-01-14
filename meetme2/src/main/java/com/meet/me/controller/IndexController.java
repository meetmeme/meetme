package com.meet.me.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.meet.me.service.EventService;
import com.meet.me.service.HashtagService;

@Controller
public class IndexController {
	@Autowired
	private EventService eventService;

	@Autowired
	private HashtagService hashtagService;
	
	
	//메인 화면 -카테고리, 해시태그 값을 가져감
	@GetMapping(value="/main.index")
	public ModelAndView index(ModelAndView mv, HttpServletResponse response,HttpServletRequest request) {
		response.setContentType("text/html;charset=UTF-8");
		List<String> category = eventService.getCategory();
		
		mv.setViewName("main/main");
		mv.addObject("category", category);
		
		return mv;
	}
	
	@GetMapping(value="/getHashtag.wd")
	public void getHashtag(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String title = request.getParameter("param");
		List<String> hashtag = hashtagService.getHashtag(title);
		System.out.println(hashtag);
		
		Gson gson = new Gson();
		String jsonList = gson.toJson(hashtag);
		response.getWriter().write(jsonList);
		
	}
}
