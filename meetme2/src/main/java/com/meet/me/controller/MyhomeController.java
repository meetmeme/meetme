package com.meet.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyhomeController {

	@RequestMapping(value = "/mmain.mh", method = RequestMethod.GET)
	public String mmain() {
		return "myhome/mmain";
		
	}
}
