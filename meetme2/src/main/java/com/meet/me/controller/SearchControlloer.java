package com.meet.me.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.service.EventService;

@Controller
public class SearchControlloer {

	@Autowired
	private EventService eventService;

	@PostMapping(value = "/searchEvent.sc")
	public ModelAndView searchEvent(ModelAndView mv, HttpServletRequest request) {
		
		mv.setViewName("search/searchEvent");

		return mv;
	}
	
	@PostMapping(value = "/searchMinihome.sc")
	public ModelAndView searchMinihome(ModelAndView mv, HttpServletRequest request) {
		
		mv.setViewName("search/searchMinihome");
		
		return mv;
	}
}