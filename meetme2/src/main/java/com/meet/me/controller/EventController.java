package com.meet.me.controller;


import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Event;
import com.meet.me.domain.User;
import com.meet.me.service.EventService;
import com.meet.me.service.UserService;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	@Autowired
	UserService userservice;

	@RequestMapping(value = "/event.main", method = RequestMethod.GET)
	public ModelAndView DetailPage(ModelAndView mv, @RequestParam int event) {		
		Event e = eventService.getDetail(event);	
		int count = eventService.getAttend(event);
		List<User> u = eventService.getUser(event);
		if(e == null) {
			System.out.println("detail 실패");
		}else {
			mv.setViewName("event/eventDetail");
			mv.addObject("event",e);
			mv.addObject("count",count);
			mv.addObject("user",u);
		}
		return mv;		
	}
	
	// 이벤트 등록 폼
	@RequestMapping(value = "/new.event", method = RequestMethod.GET)
	public ModelAndView NewEvent(ModelAndView mv) {
		List<String> category = eventService.getCategory();
		mv.setViewName("event/newEvent");
		mv.addObject("HeaderComment", "Create New Event");
		mv.addObject("category",category);
		return mv;		
	}
	
	// 이벤트 등록
	@RequestMapping(value = "/createEvent.event", method = RequestMethod.POST)
	public String createEvent(Event event, HttpServletRequest request, HttpServletResponse response)throws Exception {
		System.out.println("등록시작");
		
		String id = event.getUser_id();
		int num = eventService.getUser_num(id);
		System.out.println("사용자 num = " + num);
		event.setUSER_NUM(num);
		
		
		List<MultipartFile> uploadfile = event.getUpload();
		if(!uploadfile.isEmpty()) {			
			//새로운 폴더 이름 : 오늘 년+월+일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //오늘 년도 구합니다.
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
			int date = c.get(Calendar.DATE); //오늘 일 구합니다.
			
			String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "\\upload\\event\\";
			
			String homedir = saveFolder + year + "-" + month + "-" + date;
			System.out.println(homedir);
			  
			File path1 = new File(homedir);
			if(!(path1.exists())) {
				path1.mkdir(); //새로운 폴더를 생성
			}
			
			for (MultipartFile mf : uploadfile) {
				String fileName = mf.getOriginalFilename(); //원래 파일명
				event.setEVENT_ORIGINAL(fileName); //원래 파일명 저장
				  
				//난수를 구합니다.
				Random r = new Random();
				int random = r.nextInt(100000000);
				
				/***확장자 구하기 시작 ***/
				int index = fileName.lastIndexOf(".");
				//문자열에서 특정 문자열의 위치 값(index)를 반환한다.
				//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
				//lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
				//(파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
				System.out.println("index = " + index);
				 
				String fileExtension = fileName.substring(index + 1);
				System.out.println("fileExtension = " + fileExtension);
				/***확장자 구하기 끝 ***/
				  
				  
				//새로운 파일명
				String refileName = "bbs" + year + month + date + random + "." + fileExtension;
				System.out.println("refileName = " + refileName);
				 
				//오라클 DB에 저장될 파일명
				String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
				System.out.println("fileDBName = " + fileDBName);
				  
				//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				mf.transferTo(new File(saveFolder + fileDBName));
				 
				//바뀐 파일명으로 저장
				event.setEVENT_SAVE(fileDBName);
			}		
			System.out.println("사진 끝");
		}
		
		String row = event.getRow_hashtag();
		System.out.println(row);
		if(!row.isEmpty()) {
			String[] hashtag = row.trim().split("#");
			for(int i=0; i<hashtag.length; i++) {
				if(!hashtag[i].equals("")) {
					int has = eventService.has(hashtag[i]); // has = HASHTAG_NUM
					if(has!=0) { // 해시태그가 있는 경우
						eventService.insertTagUse(has);
					}else { // 해시태그가 없는 경우
						eventService.insertHashtag(hashtag[i]);
						int has2 = eventService.has(hashtag[i]);
						eventService.insertTagUse(has2);						
					}					
				}
			}
			System.out.println("태그들 다 추가함");			
		}
		
		  
		eventService.insertEvent(event); //저장메서드 호출
		
		return "redirect:main.index";
			
	}
	
	
	
	
	
	
	
	
	
	
}