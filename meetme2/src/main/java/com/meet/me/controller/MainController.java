package com.meet.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/event.main", method = RequestMethod.GET)
	public String main() {
		return "event/eventDetail";
		
	}
}
