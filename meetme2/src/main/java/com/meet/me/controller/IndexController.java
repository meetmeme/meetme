package com.meet.me.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView index(ModelAndView mv, HttpServletResponse response) {
	
		List<String> category = eventService.getCategory();
		System.out.println(category.size());
		List<String> hashtag = hashtagService.getHashtag();
		
		mv.setViewName("main/main");
		mv.addObject("category", category);
		mv.addObject("hashtag", hashtag);
		
		return mv;
	}
}
