package com.meet.me.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Board;
import com.meet.me.domain.Follows;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;
import com.meet.me.service.EventService;
import com.meet.me.service.MyHomeService;
import com.meet.me.service.UserService;

@Controller
public class MyhomeController {

	@Autowired
	MyHomeService mhservice;

	@Autowired
	UserService userservice;
	
	@Autowired
	EventService eventservice;
	

	@RequestMapping(value = "/mmain.mh", method = RequestMethod.GET)
	public ModelAndView mmain(@RequestParam("id") String m_id, HttpSession session, ModelAndView mv,
			HttpServletRequest request) throws Exception {

		MyHome mh_info = mhservice.getinfo(m_id);
		User m_info = userservice.user_info(m_id);
		
		if (mh_info == null || m_info == null) {
			System.out.println("정보 수집 실패");
		} else {
			mv.setViewName("myhome/mmain");
			mv.addObject("mh_info", mh_info);
			mv.addObject("m_info", m_info);
		}
		return mv;
	}

	@RequestMapping(value = "/mprofile.mh", method = RequestMethod.GET)
	public ModelAndView mprofile(HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {

		String user_id = (String) session.getAttribute("user_id1");
		int user_num = (int) session.getAttribute("user_num1");
		MyHome mhinfo = mhservice.getinfo(user_id);
		User userinfo = userservice.user_info(user_id);
		

		//카테고리 리스트 가져오기
		Map<String,List<String>> map = new HashMap<String,List<String>>(); 
		List<String> categoryList = new ArrayList<String>();
		categoryList = eventservice.getCategory();
		map.put("categoryList",categoryList);
		
		List<User_interests> user_interests = userservice.getInterestsNums(user_num);

		for (User_interests u : user_interests)
			System.out.println(u);

		if (mhinfo == null || userinfo == null) {
			System.out.println("정보 수집 실패");
		} else {
			mv.setViewName("myhome/mprofile");
			mv.addObject("mhinfo", mhinfo);
			mv.addObject("userinfo", userinfo);
			mv.addObject("user_interests", user_interests);
			mv.addObject("categoryList", categoryList);
		}
		return mv;
	}

	@RequestMapping(value = "/mevent.mh", method = RequestMethod.GET)
	public String mevent() {
		return "myhome/mevent";
	}
//
//	@RequestMapping(value = "/mboard.mh", method = RequestMethod.GET)
//	public String mboard() {
//		return "myhome/mboard";
//	}

	// 프로필 수정
	@RequestMapping(value = "/updateProfile.mh", method = RequestMethod.POST)
	public void updateProfile(User user, User_interests user_interests, MyHome myhome, 
			@RequestParam("category") String category, ModelAndView mv,
			HttpSession session, HttpServletResponse response) throws IOException {

		/****기본프로필 수정****/
		String user_id = (String) session.getAttribute("user_id1");
		int user_num = user.getUser_num();
		MultipartFile uploadfile = user.getUploadfile();

		User user2 = userservice.user_info(user_id);
		user.setUser_original(user2.getUser_original());
		user.setUser_save(user2.getUser_save());
		
		if (uploadfile.getOriginalFilename()!="") {
			if (!uploadfile.isEmpty()) {
				String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
				user.setUser_original(fileName); // 원래 파일명 저장

				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR); // 오늘 년 구합니다.
				int month = c.get(Calendar.MONTH) + 1;// 오늘 월 구합니다.
				int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
				
				String saveFolder = "C:\\Users\\32426\\git\\m2\\meetme\\meetme2\\src\\main\\webapp\\resources\\upload\\";
				String homedir = saveFolder + year + "-" + month + "-" + date;
				File path1 = new File(homedir);
				if (!(path1.exists())) { // 이 파일의 경로가 존재하는지 확인
					path1.mkdir(); // 없을 경우 경로 만들기
				}

				Random r = new Random();
				int random = r.nextInt(100000000);

				int index = fileName.lastIndexOf(".");
				String fileExtension = fileName.substring(index + 1); // 확장자만 따로 뻄
				String refileName = "bbs" + year + month + date + random + "." + fileExtension;
				String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				user.setUser_save(fileDBName);
			}
		}

		int result1 = userservice.update(user);
		
		//Interests 수정
		String tmp[] = category.split(",");
		List<Integer> cat_list = new ArrayList<Integer>(); 
		for (int i = 0; i < tmp.length; i++) {
			if (tmp[i] != null && !tmp[i].equals("")) {
				cat_list.add(Integer.parseInt(tmp[i]));
			}
		}
		
		user_interests = new User_interests();
		user_interests.setUser_num(user_num);
		//기존 흥미 정보 삭제
		userservice.delete_interests(user_id);
		//신규 흥미 정보 삽입
		for(int i : cat_list) {
			user_interests.setCategory_num(i);
			userservice.category(user_interests);
		}

		/***미니홈피 프로필 수정***/
		mhservice.update(myhome);

		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result1 == 1) {
			out.println("location.href='mprofile.mh?id=" + user_id + "'");
		} else {
			System.out.println("업데이트 실패");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();

	}
	
	//팔로워 표시
	@ResponseBody
	@RequestMapping(value = "/follower.mh", method = RequestMethod.POST)
	public List<Follows> followers(@RequestParam(value="id", required=false) String m_id, ModelAndView mv) throws Exception {
		List<Follows> follows = new ArrayList<Follows>();
		User m_info = userservice.user_info(m_id);
		follows=mhservice.follows(m_info.getUser_num());
		System.out.println("팔로우 정보 : " + follows.size());
		return follows;
	}


}
