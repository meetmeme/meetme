package com.meet.me.controller;


import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Attendee;
import com.meet.me.domain.Event;
import com.meet.me.domain.Gallery;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.User;
import com.meet.me.service.EventService;
import com.meet.me.service.UserService;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	@Autowired
	UserService userservice;
	
	// 쿠키 아이디 구하기
	public String cookieId(HttpServletRequest request) {		
		String id = "못가져옴";
		try{
			Cookie[] cookies = request.getCookies();                 // 요청에서 쿠키를 가져온다.
			if(cookies!=null){                                                    // 쿠키가 Null이 아닐때,
				for(int i=0; i<cookies.length; i++){                        // 쿠키를 반복문으로 돌린다.
					if(cookies[i].getName().equals("userInputId")){            // 쿠키의 이름이 id 일때
					id=cookies[i].getValue();                        // 해당 쿠키의 값을 id 변수에 저장한다.
					}
				}	
			}
		}catch(Exception ex){}			
		return id;						
	}	

	@RequestMapping(value = "/event.main", method = RequestMethod.GET)
	public ModelAndView DetailPage(Event ev, Attendee att, ModelAndView mv, HttpServletRequest request, @RequestParam int event) {		
		Event e = eventService.getDetail(event);	
		int count = eventService.getAttend(event);
		List<User> u = eventService.getUser(event);
		List<Gallery> gall	= eventService.getGall(event);
		List<Hashtag> tag = eventService.getHashtag(event);
		int remain = e.getEVENT_MAX() - eventService.getRemain(event);
		System.out.println("남은 자리="+remain);
		
		String id = cookieId(request);		
		// user_id으로 user_num구하기
		System.out.println("id = "+id);
		int num = eventService.getUSER_NUM(id);
		System.out.println("USER_NUM = " + num);
		
		att.setUser_num(num);
		att.setEvent_num(event);		
		int attend = eventService.isAttend(att);		
		
		mv.setViewName("event/eventDetail");
		mv.addObject("event",e);
		mv.addObject("count",count);
		mv.addObject("user",u);
		mv.addObject("gall", gall);
		mv.addObject("tag", tag);
		mv.addObject("remain", remain);
		mv.addObject("att", attend);	
		
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
	public String createEvent(Attendee att, Event event, Gallery gall, HttpServletRequest request, HttpServletResponse response)throws Exception {
		System.out.println("등록시작");
		
		System.out.println("날짜"+event.getEVENT_DATE());
		
		// user_id으로 user_num구하기
		String id = event.getUser_id();
		int num = eventService.getUSER_NUM(id);
		System.out.println("USER_NUM = " + num);
		event.setUSER_NUM(num);
		
		// 엔터 구별
		String content = event.getEvent_detail();
		content = content.replace("\r\n","<br>");
		event.setEVENT_CONTENT(content);
		
		int event_num;
		List<MultipartFile> uploadfile = event.getUpload();
		if(!uploadfile.isEmpty()) {			
			//새로운 폴더 이름 : 오늘 년+월+일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //오늘 년도 구합니다.
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
			int date = c.get(Calendar.DATE); //오늘 일 구합니다.
			//String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/uploadevent/";
			String saveFolder = "D:\\mm\\0128\\meetme\\meetme2\\src\\main\\webapp\\resources\\upload\\event\\";
			
			
			String homedir = saveFolder + year + "-" + month + "-" + date;
			System.out.println(homedir);
			  
			File path1 = new File(homedir);
			if(!(path1.exists())) { // 이 파일 경로가 존재 안하면
				path1.mkdir(); //새로운 폴더를 생성
			}
			int count = 0;
			for (MultipartFile mf : uploadfile) {				
				 //원래 파일명 저장
				String fileName = mf.getOriginalFilename(); //원래 파일명
				if(count == 0) {
					event.setEVENT_ORIGINAL(fileName);
				}else {
					gall.setEVENT_GALLERY_ORIGINAL(fileName);
				}				
				  
				//난수를 구합니다.
				Random r = new Random();
				int random = r.nextInt(100000000);
				
				// 확장자 구하기
				int index = fileName.lastIndexOf(".");
				System.out.println("index = " + index);				 
				String fileExtension = fileName.substring(index + 1);
				System.out.println("fileExtension = " + fileExtension);				  
				  
				//새로운 파일명
				String refileName = "bbs" + year + month + date + random + "." + fileExtension;
				System.out.println("refileName = " + refileName);				 
				//오라클 DB에 저장될 파일명
				String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
				System.out.println("fileDBName = " + fileDBName);				  
				//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				mf.transferTo(new File(saveFolder + fileDBName));	

				//바뀐 파일명으로 저장
				if(count == 0) {
					event.setEVENT_SAVE(fileDBName);
					eventService.insertEvent(event); //저장메서드 호출					
				}else {
					// 방금 넣은 event_num
					event_num = eventService.getEventnum();
					gall.setEVENT_GALLERY(fileDBName);
					gall.setEVENT_NUM(event_num);
					eventService.insertGallery(gall);
				}				
				count++;				
			}					
		}		
		
		// 방금 넣은 event_num
		event_num = eventService.getEventnum();	
		System.out.println("등록한 이벤트 번호 = " + event_num);
		
		String row = event.getRow_hashtag();
		if(!row.isEmpty()) {
			String[] hashtag = row.split("#");
			for(int i=1; i<hashtag.length; i++) {
					String thistag = hashtag[i].trim();
					System.out.println("지금 해시태그 = "+thistag);
					int tagnum = eventService.has(thistag); // has = HASHTAG_NUM
					if(tagnum!=0) { // 해시태그가 있는 경우
						eventService.insertTagUse(tagnum, event_num);
					}else { // 해시태그가 없는 경우
						eventService.insertHashtag(thistag);
						int tagnum2 = eventService.has(thistag);
						eventService.insertTagUse(tagnum2, event_num);	
				}
			}	
		}
		
		att.setUser_num(num);
		att.setEvent_num(event_num);
		int attend = eventService.insertAttend(att);
		System.out.println("주최자 참석됨? "+attend);
		
		return "redirect:event.main?event="+event_num;			
	}
	
	
	// 이벤트 참석
	@RequestMapping(value = "/Attend.event", method = RequestMethod.GET)
	public String Attend(Attendee att, ModelAndView mv, @RequestParam int event, HttpServletRequest request) {		
		String id = cookieId(request);
		int num = eventService.getUSER_NUM(id);
		att.setUser_num(num);
		att.setEvent_num(event);
		
		int attend = eventService.insertAttend(att);
		System.out.println("참석됨? "+attend);
		return "redirect:event.main?event="+event;		
	}
	
	// 참석 취소 cancelAttend
	@RequestMapping(value = "/cancelAttend.event", method = RequestMethod.GET)
	public String cancelAttend(Attendee att, ModelAndView mv, @RequestParam int event, HttpServletRequest request) {		
		String id = cookieId(request);
		int num = eventService.getUSER_NUM(id);
		att.setUser_num(num);
		att.setEvent_num(event);
		
		int attend = eventService.deleteAttend(att);
		System.out.println("참석취소됨? "+attend);
		return "redirect:event.main?event="+event;		
	}
	
	
	
	
	
	
	
	
}