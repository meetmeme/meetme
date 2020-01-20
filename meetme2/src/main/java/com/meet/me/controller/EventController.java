package com.meet.me.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Event;
import com.meet.me.domain.User;
import com.meet.me.service.EventService;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping(value = "/event.main", method = RequestMethod.GET)
	public ModelAndView DetailPage(ModelAndView mv, @RequestParam int event) {
		Event e = eventService.getDetail(event);	
		int count = eventService.getAttend(event);
		List<User> u = eventService.getUser(event);
		if(e == null) {
			System.out.println("detail 없어");
		}else {
			System.out.println("detail 성공");
			mv.setViewName("event/eventDetail");
			mv.addObject("event",e);
			mv.addObject("count",count);
			mv.addObject("user",u);
		}
		return mv;		
	}
	
	@RequestMapping(value = "/new.event", method = RequestMethod.GET)
	public ModelAndView NewEvent(ModelAndView mv) {
		mv.setViewName("event/newEvent");
		mv.addObject("HeaderComment", "Create New Event");
		return mv;		
	}
	
	
	
	
	
	
	
	
	
	
}