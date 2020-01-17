package com.meet.me.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.meet.me.domain.Event;
import com.meet.me.domain.Hashtag;
import com.meet.me.service.EventService;
import com.meet.me.service.HashtagService;

@Controller
public class SearchControlloer {

	@Autowired
	private EventService eventService;

	@Autowired
	private HashtagService hashtagService;
//	@Autowired
//	private BoardService boardService;

	@PostMapping(value = "/searchEvent.sc")
	public ModelAndView searchEvent(ModelAndView mv, HttpServletRequest request) {

		String searchKeyword = request.getParameter("searchKeyword");
		searchKeyword = searchKeyword == "" ? null : searchKeyword;
		String searchHashtag = request.getParameter("searchHashtagNum");
		String searchCategoryValue = request.getParameter("searchCategory");
		String categoryNum = searchCategoryValue.split("_")[0];
		String categoryTitle = searchCategoryValue.split("_")[1];
		searchCategoryValue = categoryNum;
		String search_dateStart = request.getParameter("search-dateStart") + " 00:00:00";
		String search_dateEnd = request.getParameter("search-dateEnd") + " 23:59:59";

		Map<String, String> searchKey = new HashMap<String, String>();
		searchKey.put("keyword", searchKeyword);
		searchKey.put("searchHashtag", searchHashtag);
		searchKey.put("searchCategory", categoryTitle);
		searchKey.put("search_dateStart", search_dateStart.substring(0, 10));
		searchKey.put("search_dateEnd", search_dateEnd.substring(0, 10));

		List<Event> searchResult = new ArrayList<Event>();
		
		
		if (searchKeyword != null || !searchCategoryValue.equals("0")) {
			Map<String, String> keywords = new HashMap<String, String>();
			keywords.put("keyword", "%" + searchKeyword + "%");
			keywords.put("category", searchCategoryValue);
			keywords.put("dateStart", search_dateStart);
			keywords.put("dateEnd", search_dateEnd);
			System.out.println("event : " + keywords);

			List<Event> events = eventService.search(keywords);
			searchResult.addAll(events);
		}

		if (searchHashtag.length() > 0) {
			Map<String, String> keywords = new HashMap<String, String>();
			keywords.put("hashtag", searchHashtag);
			keywords.put("dateStart", search_dateStart);
			keywords.put("dateEnd", search_dateEnd);
			System.out.println("hasht : " + keywords);

			List<Event> events = eventService.searchHash(keywords);
			searchResult.addAll(events);
		}

		if (searchHashtag.length() <= 0 && searchKeyword == null && searchCategoryValue.equals("0")) {
			Map<String, String> keywords = new HashMap<String, String>();
			keywords.put("dateStart", search_dateStart);
			keywords.put("dateEnd", search_dateEnd);
			System.out.println("dates : " + keywords);

			List<Event> events = eventService.searchDate(keywords);
			searchResult.addAll(events);
		}

		for (int i = 0; i < searchResult.size(); i++) {
			for (int j = i + 1; j < searchResult.size(); j++) {
				if (searchResult.get(j).getEVENT_NUM() == searchResult.get(i).getEVENT_NUM())
					searchResult.remove(j);
			}
		}

		System.out.println("----");
		for (Event e : searchResult) {
			System.out.print(e.getEVENT_TITLE() + "\t");
		}
		System.out.println("\n----");

		mv.setViewName("search/searchEvent");
		mv.addObject("events", searchResult);
		mv.addObject("searchKey", searchKey);
		mv.addObject("HeaderComment", "Event Search Results");

		return mv;
	}

	@PostMapping(value = "/searchMinihome.sc")
	public ModelAndView searchMinihome(ModelAndView mv, HttpServletRequest request) {

		mv.setViewName("search/searchMinihome");
		mv.addObject("HeaderComment", "Minihome Search Results");

		return mv;
	}

	@GetMapping(value = "searchHashtag.wd")
	@ResponseBody
	public int searchHashtag(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String hashtag = request.getParameter("param");
		System.err.println(hashtag);
		int hashtagNum = hashtagService.searchHashtag(hashtag);
		System.err.println("num : " + hashtagNum);
		return hashtagNum;
	}

	@GetMapping(value = "/getHashtag.wd")
	public void getHashtag(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String title = request.getParameter("param");
		List<Hashtag> hashtag = hashtagService.getHashtag(title);

		Gson gson = new Gson();
		String jsonList = gson.toJson(hashtag);
		response.getWriter().write(jsonList);

	}
	
	@GetMapping(value = "/getCategory.wd")
	public void getCategory(HttpServletResponse response) throws IOException {
		List<String> category = eventService.getCategory();

		Gson gson = new Gson();
		String jsonList = gson.toJson(category);
		response.getWriter().write(jsonList);
		
	}

}