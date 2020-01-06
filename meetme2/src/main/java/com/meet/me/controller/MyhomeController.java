package com.meet.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyhomeController {
	@RequestMapping(value = "/mmain.mh", method = RequestMethod.GET)
	public String login() {
		return "myhome/mmain";
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
