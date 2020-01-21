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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.meet.me.domain.Event;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.User;
import com.meet.me.service.EventService;
import com.meet.me.service.HashtagService;
import com.meet.me.service.MyHomeService;

@Controller
public class SearchControlloer {

	@Autowired
	private EventService eventService;

	@Autowired
	private MyHomeService mimihomeService;

	@Autowired
	private HashtagService hashtagService;

	@PostMapping(value = "/searchEvent.sc")
	public ModelAndView searchEvent(ModelAndView mv, HttpServletRequest request) {

		String searchKeyword = request.getParameter("searchKeyword");
		searchKeyword = searchKeyword == "" ? null : searchKeyword;
		String searchHashtag = request.getParameter("searchHashtagNum");
		String searchHashtagValue = request.getParameter("searchHashtag");
		searchHashtag = searchHashtag == "" ? "null" : searchHashtag;
		String searchCategoryValue = request.getParameter("searchCategory");
		String categoryNum = searchCategoryValue.split("_")[0];
		String categoryTitle = searchCategoryValue.split("_")[1];
		searchCategoryValue = categoryNum;
		String search_dateStart = request.getParameter("search-dateStart") + " 00:00:00";
		String search_dateEnd = request.getParameter("search-dateEnd") + " 23:59:59";

		Map<String, String> searchKey = new HashMap<String, String>();
		searchKey.put("keyword", searchKeyword);
		searchKey.put("searchHashtag", searchHashtagValue);
		searchKey.put("searchCategory", categoryTitle);
		searchKey.put("search_dateStart", search_dateStart.substring(0, 10));
		searchKey.put("search_dateEnd", search_dateEnd.substring(0, 10));

		List<Event> searchResult = new ArrayList<Event>();

		if (searchKeyword != null || !searchCategoryValue.equals("0") || !searchHashtag.equals("null")) {
			Map<String, String> keywords = new HashMap<String, String>();
			keywords.put("keyword", "%" + searchKeyword + "%");
			keywords.put("category", searchCategoryValue);
			keywords.put("hashtag", searchHashtag);
			keywords.put("dateStart", search_dateStart);
			keywords.put("dateEnd", search_dateEnd);
			System.out.println("event : " + keywords);

			searchResult = eventService.search(keywords);
		}

		else {
			Map<String, String> keywords = new HashMap<String, String>();
			keywords.put("dateStart", search_dateStart);
			keywords.put("dateEnd", search_dateEnd);
			System.out.println("dates : " + keywords);

			searchResult = eventService.searchDate(keywords);
		}


		for(Event e : searchResult) {
			String title = e.getEVENT_TITLE();
			String context = e.getEVENT_CONTENT();
			if(context.length() > 100)
				e.setEVENT_CONTENT(context.substring(0, 100)+" ...");
			if(title.length() > 20)
				e.setEVENT_TITLE(title.substring(0, 20)+" ...");
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
		String searchKeyword = request.getParameter("searchKeyword");
		searchKeyword = searchKeyword == "" ? null : searchKeyword;
		String searchHashtag = request.getParameter("searchHashtagNum");
		searchHashtag = searchHashtag == "" ? "null" : searchHashtag;
		String searchHashtagValue = request.getParameter("searchHashtag");
		String searchUser = request.getParameter("searchUser");
		searchUser = searchUser == "" ? null : searchUser;

		Map<String, String> searchKey = new HashMap<String, String>();
		searchKey.put("keyword", searchKeyword);
		searchKey.put("searchHashtag", searchHashtagValue);
		searchKey.put("searchUser", searchUser);

		List<User> searchResultMinihome = new ArrayList<User>();
//		List<Post> searchResultMiniPost = new ArrayList<Post>();
		List<Event> searchResultMiniEvent = new ArrayList<Event>();

		Map<String, String> keywords = new HashMap<String, String>();
		keywords.put("keyword", "%" + searchKeyword + "%");
		keywords.put("category", "0");
		keywords.put("hashtag", searchHashtag);
		keywords.put("dateStart", "0000-00-00 00:00:00");
		keywords.put("searchUser", "%" + searchUser + "%");
		System.out.println("event : " + keywords);

		// minihome 검색
		searchResultMinihome = mimihomeService.search(keywords);

		// event 검색
		searchResultMiniEvent = eventService.search(keywords);

		System.out.println("----");
		for (User e : searchResultMinihome) {
			System.out.print(e.getUser_name() + "\t");
		}
		System.out.println("\n----");

		for (Event e : searchResultMiniEvent) {
			String title = e.getEVENT_TITLE();
			String context = e.getEVENT_CONTENT();
			if (context.length() > 150)
				e.setEVENT_CONTENT(context.substring(0, 150) + " ...");
			if (title.length() > 25)
				e.setEVENT_TITLE(title.substring(0, 25) + " ...");
		}

		mv.setViewName("search/searchMinihome");
		mv.addObject("minihome", searchResultMinihome);
//		mv.addObject("posts", searchResultMiniPost);
		mv.addObject("events", searchResultMiniEvent);
		mv.addObject("searchKey", searchKey);
		mv.addObject("HeaderComment", "Minihome Search Results");

		return mv;
	}

	@GetMapping(value = "/hashtag.sc")
	public ModelAndView searchHashtag(ModelAndView mv, HttpServletRequest request,
			@RequestParam("hashtag") String hashtag) {
		List<User> searchResultMinihome = new ArrayList<User>();
//		List<Post> searchResultMiniPost = new ArrayList<Post>();
		List<Event> searchResultMiniEvent = new ArrayList<Event>();

		// minihome 검색
		searchResultMinihome = mimihomeService.searchHash("%" + hashtag + "%");

		// event 검색
		searchResultMiniEvent = eventService.searchHash("%" + hashtag + "%");

		System.out.println("----");
		for (User e : searchResultMinihome) {
			System.out.print(e.getUser_name() + "\t");
		}
		System.out.println("\n----");

		mv.setViewName("search/searchHahtag");
		mv.addObject("minihome", searchResultMinihome);
//		mv.addObject("posts", searchResultMiniPost);
		mv.addObject("events", searchResultMiniEvent);
		mv.addObject("hashtag", hashtag);
		mv.addObject("HeaderComment", "look who's use hashtag '#" + hashtag + "'!");

		return mv;
	}
	
	@GetMapping(value = "/category.sc")
	public ModelAndView searchCatregoryEvent(ModelAndView mv, HttpServletRequest request,
			@RequestParam("category") String category) {
//		List<Post> searchResultMiniPost = new ArrayList<Post>();
		List<Event> searchResultMiniEvent = new ArrayList<Event>();
		
		// event 검색
		searchResultMiniEvent = eventService.searchCat("%" + category + "%");
		
		for(Event e : searchResultMiniEvent) {
			String title = e.getEVENT_TITLE();
			String context = e.getEVENT_CONTENT();
			if(context.length() > 100)
				e.setEVENT_CONTENT(context.substring(0, 100)+" ...");
			if(title.length() > 20)
				e.setEVENT_TITLE(title.substring(0, 20)+" ...");
		}
		
		mv.setViewName("search/searchHahtag");
//		mv.addObject("posts", searchResultMiniPost);
		mv.addObject("events", searchResultMiniEvent);
		mv.addObject("categorysearch", category);
		mv.addObject("HeaderComment", " '" + category + "' Events!");
		
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