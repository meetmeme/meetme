package com.meet.me.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Event;
import com.meet.me.service.EventService;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping(value = "/event.main", method = RequestMethod.GET)
	public ModelAndView DetailPage(ModelAndView mv, @RequestParam int event) {
		Event e = eventService.getDetail(event);	
		if(e == null) {
			System.out.println("detail 없어");
		}else {
			System.out.println("detail 성공");
			mv.setViewName("event/eventDetail");
			mv.addObject("event",e);
		}
		return mv;		
	}
}