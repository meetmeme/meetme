package com.meet.me.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Dash;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;
import com.meet.me.service.DashService;
import com.meet.me.service.ReportService;
import com.meet.me.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private DashService dashService;
	
	
	@RequestMapping(value = "/dash.ad", method = RequestMethod.GET)
	public ModelAndView dash(ModelAndView mv) {
		
		//카테고리 리스트 가져오기
		Map<String,List<String>> map = new HashMap<String,List<String>>(); 
		List<String> categoryList = new ArrayList<String>();
		categoryList = dashService.getCategory();
		map.put("categoryList",categoryList);
		
		//사용자 카테고리 별 카운트
		List<Integer> categoryCount = new ArrayList<Integer>(); 
		int count = 0;
		for(int category_num=1; category_num<=categoryList.size();category_num++) {
			count = dashService.interCount(category_num);
			categoryCount.add(category_num-1, count);
		}
		
		//월별 게시글 카운트
		String[] month = {"01","02","03","04","05","06","07","08","09","10","11","12"};
		
		
		List<Integer> boardCount = new ArrayList<Integer>();
		int count2 = 0;
		for(int i=0; i<month.length;i++) {
			count2 = dashService.boardCount(month[i]);
			boardCount.add(i,count2);
		}
		
		//일별 게시글 카운트
		String[] day = new String[31];
		for(int i=1;i<=31;i++) {
			if(i>=1 && i<=9) {
				day[i-1] = "0"+i;
			}else {
				day[i-1] = Integer.toString(i);
			}
		}
		
		List<Integer> dayCount = new ArrayList<Integer>();
		int count3 = 0;
		for(int i=0;i<day.length;i++) {
			count3 = dashService.dayCount(day[i]);
			dayCount.add(i, count3);
		}
		
		
		mv.setViewName("admin/dash");
		mv.addObject("categoryList", categoryList);
		mv.addObject("categoryCount", categoryCount);
		mv.addObject("boardCount", boardCount);
		mv.addObject("dayCount", dayCount);
		return mv;
	}
	
	@RequestMapping(value = "/user_list.ad")
	public ModelAndView memberList(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="5", required=false) int limit,
			ModelAndView mv,
			@RequestParam(value="search_field", defaultValue="-1") int index,
			@RequestParam(value="search_word", defaultValue="") String search_word)
	throws Exception {
		
		List<User> list = null;
		int listcount = 0;
		
		list = userService.getSearchList(index, search_word, page, limit);

		listcount = userService.getSearchListCount(index, search_word);
		
		//총 페이지수
		int maxpage = (listcount + limit -1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지 수
		int startpage = ((page - 1)/5)*5 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지 수
		int endpage = startpage + 5 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mv.setViewName("admin/user_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("userlist", list);
		mv.addObject("limit", limit);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		
		return mv;
	}
	
	//회원의 개인정보
	@RequestMapping(value = "/user_info.ad", method = RequestMethod.GET)
	public ModelAndView user_info(@RequestParam("user_id") String user_id, ModelAndView mv) {
		User user = userService.user_info(user_id);
		mv.setViewName("admin/user_info");
		mv.addObject("userinfo", user);
		
		return mv;
	}
	
	@RequestMapping(value="/user_delete.ad", method=RequestMethod.GET)
	public String user_delete(String user_id, HttpServletResponse response) throws Exception{
		int result = userService.delete(user_id);
		if(result != 1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 정보 삭제에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		return "redirect:user_list.ad";
	}
	
	@RequestMapping(value="/report.ad", method=RequestMethod.GET)
	public ModelAndView report(ModelAndView mv) {
		
		//신고 수
		int userCount = 0;
		int eventCount = 0;
		userCount = reportService.userCount();
		eventCount = reportService.eventCount();
		
		//신고 디테일
		List<String> userReport = new ArrayList<String>();
		List<String> eventReport = new ArrayList<String>();
		userReport = reportService.userReport();
		eventReport = reportService.eventReport();
		
		
		mv.addObject("userCount", userCount);
		mv.addObject("eventCount", eventCount);
		mv.addObject("userReport", userReport);
		mv.addObject("eventReport", eventReport);
		mv.setViewName("admin/report");
		return mv;
	}
	
		
}
