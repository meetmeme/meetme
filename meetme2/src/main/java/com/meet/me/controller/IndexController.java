package com.meet.me.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.meet.me.domain.Event;
import com.meet.me.domain.Notice;
import com.meet.me.domain.User;
import com.meet.me.service.CommunityService;
import com.meet.me.service.EventService;
import com.meet.me.service.HashtagService;
import com.meet.me.service.UserService;

@Controller
public class IndexController {
	@Autowired
	private EventService eventService;

	@Autowired
	private HashtagService hashtagService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommunityService communityService;
	
	
	//메인 화면 -카테고리, 해시태그 값을 가져감
	@GetMapping(value="/main.index")
	public ModelAndView index(ModelAndView mv, HttpServletResponse response,HttpServletRequest request, HttpSession session, 
								@RequestParam(value = "note", defaultValue = "false") String note) {
		response.setContentType("text/html;charset=UTF-8");
		
		String id = "";
		
		if(session.getAttribute("user_id1") != null)
			id = session.getAttribute("user_id1").toString();
		
		int num = 0;
		
		if(session.getAttribute("user_id1") != null)
			num = Integer.parseInt(session.getAttribute("user_num1").toString());
		List<String> category = eventService.getCategory();
		List<Event> event = eventService.getIntrestingEvent(id);
		List<User> RandomUser = userService.getRandomUser();
		List<Notice> notification = communityService.getNotification(num);
		
		System.out.println(RandomUser.size());
		for(User u : RandomUser)
		System.out.println(u.getUser_id());
		
		mv.setViewName("main/main");
		mv.addObject("category", category);
		mv.addObject("event", event);
		mv.addObject("RandomUser", RandomUser);
		mv.addObject("notification", notification);
		mv.addObject("note", note);
		
		mv.addObject("HeaderComment", "The real world is calling");
		
		
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
