package com.meet.me.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Event;
import com.meet.me.domain.Hashtag;
import com.meet.me.service.EventService;
import com.meet.me.service.HashtagService;

@Controller
public class SearchControlloer {

	@Autowired
	private EventService eventService;

//	@Autowired
//	private BoardService boardService;

	@PostMapping(value = "/searchEvent.sc")
	public ModelAndView searchEvent(ModelAndView mv, HttpServletRequest request) {
		
		String searchKeyword = request.getParameter("searchKeyword");
		searchKeyword = searchKeyword == "" ? null : searchKeyword;
		String searchHashtag = request.getParameter("searchHashtag");
		String searchCategory = request.getParameter("searchCategory");
		String search_dateStart = request.getParameter("search-dateStart");
		String search_dateEnd = request.getParameter("search-dateEnd");
		
		Map<String, String> keywords = new HashMap<String, String>();
		keywords.put("keyword","%"+searchKeyword+"%");
		keywords.put("category",searchCategory);
		keywords.put("dateStart",search_dateStart);
		keywords.put("dateEnd",search_dateEnd);
		
		System.out.println(keywords);
		
		if(searchKeyword!=null || searchCategory != "all" || search_dateEnd != null) {
			List<Event> events = eventService.search(keywords);
			for(Event e : events)
				System.out.print(e.getEVENT_TITLE()+"\t");
		}
		
//		if(searchHashtag != null) {
//			List<Event> events_Hash = eventService.searchHashtag(searchHashtag);
//		}
		mv.setViewName("search/searchEvent");
		mv.addObject("HeaderComment", "Event Search Results");

		return mv;
	}

	@PostMapping(value = "/searchMinihome.sc")
	public ModelAndView searchMinihome(ModelAndView mv, HttpServletRequest request) {

		mv.setViewName("search/searchMinihome");
		mv.addObject("HeaderComment", "Minihome Search Results");

		return mv;
	}
}