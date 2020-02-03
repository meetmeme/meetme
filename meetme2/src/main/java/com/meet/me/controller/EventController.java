package com.meet.me.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Attendee;
import com.meet.me.domain.Event;
import com.meet.me.domain.EventComment;
import com.meet.me.domain.Gallery;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.Report;
import com.meet.me.domain.User;
import com.meet.me.service.EventService;
import com.meet.me.service.ReportService;
import com.meet.me.service.UserService;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	@Autowired
	UserService userservice;	
	
	@Autowired
	ReportService reportservice;

	@RequestMapping(value = "/event.main", method = RequestMethod.GET)
	public ModelAndView DetailPage(Event ev, Attendee att, ModelAndView mv, HttpServletResponse response, HttpServletRequest request, @RequestParam int event, HttpSession session)throws Exception{		
		try {
			int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());	
		} catch (Exception e) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 해주세요');");
			out.println("location.href='main.index';");
			out.println("</script>");	
			return null;			
		}			
		int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());		
		Event e = eventService.getDetail(event);	
		int count = eventService.getAttend(event);
		List<User> u = eventService.getUser(event);
		List<Gallery> gall	= eventService.getGall(event);
		List<Hashtag> tag = eventService.getHashtag(event);
		int remain = e.getEVENT_MAX() - eventService.getRemain(event);
		List<EventComment> com = eventService.getComment(event);
		
		att.setUser_num(user_num);
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
		mv.addObject("com",com);
		mv.addObject("user_num",user_num);
		
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
	public String createEvent(Attendee att, Event event, Gallery gall, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception {
		System.out.println("등록시작");
		
		System.out.println("날짜"+event.getEVENT_DATE());
		
		int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());
		event.setUSER_NUM(user_num);
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
			String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/event/";
						
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
		
		att.setUser_num(user_num);
		att.setEvent_num(event_num);
		int attend = eventService.insertAttend(att);
		
		return "redirect:event.main?event="+event_num;			
	}
	
	
	// 이벤트 참석
	@RequestMapping(value = "/Attend.event", method = RequestMethod.GET)
	public String Attend(Attendee att, ModelAndView mv, @RequestParam int event, HttpServletRequest request, HttpSession session) {		
		int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());
		att.setUser_num(user_num);
		att.setEvent_num(event);
		
		int attend = eventService.insertAttend(att);
		System.out.println("참석됨? "+attend);
		return "redirect:event.main?event="+event;		
	}
	
	// 참석 취소 cancelAttend
	@RequestMapping(value = "/cancelAttend.event", method = RequestMethod.GET)
	public String cancelAttend(Attendee att, ModelAndView mv, @RequestParam int event, HttpServletRequest request, HttpSession session) {		
		int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());
		att.setUser_num(user_num);
		att.setEvent_num(event);
		
		int attend = eventService.deleteAttend(att);
		System.out.println("참석취소됨? "+attend);
		return "redirect:event.main?event="+event;		
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/writeComment.event", method = RequestMethod.POST)
	public int writeComment(Attendee att, EventComment co, ModelAndView mv, @RequestParam String content, @RequestParam int event_num, HttpServletResponse response, HttpServletRequest request, HttpSession session)throws IOException {		
		int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());
		System.out.println("댓글 내용 = " + content);
		
		if(content=="") {
			System.out.println("내용 필요");
			return 2;
		}else {
			att.setUser_num(user_num);
			att.setEvent_num(event_num);		
			int attend = eventService.isAttend(att);
			System.out.println("얘 참석해? = "+attend);
			if(attend==0) {		
				return 0;
			}else{
				co.setEvent_num(event_num);
				co.setUser_num(user_num);
				co.setEvent_comm_content(content);
				
				int comm = eventService.writeComment(co);
				System.out.println("등록했어");
				//return "redirect:event.main?event="+event_num;
				return 1;
			}
		}
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/comDelete.event", method = RequestMethod.POST)
	public int comDelete(@RequestParam int num, HttpServletRequest request, HttpSession session) {		
		int del = eventService.comDelete(num);
		return del;
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/comUpdate.event", method = RequestMethod.POST)
	public int comUpdate(EventComment co, @RequestParam int num, @RequestParam String content) {		
		co.setEvent_comm_num(num);
		co.setEvent_comm_content(content);
		
		int up = eventService.comUpdate(co);
		return up;
	}
	
	// 이벤트 신고
	@RequestMapping(value = "/eventReport.event", method = RequestMethod.POST)
	public void eventReport(Report re, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws IOException {		
		int user_num = Integer.parseInt(session.getAttribute("user_num1").toString());
		String user_id = session.getAttribute("user_name1").toString();
		String content = request.getParameter("Content").toString();
		int event_num = Integer.parseInt(request.getParameter("event_num").toString());
		
		re.setReporter_id(user_id);
		re.setEvent_num(event_num);
		re.setReport_content(content);
		
		int report =reportservice.eventReport(re);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (report == 1) { // 신고 성공
			out.println("<script>");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else { // 실패
			out.println("<script>");
			out.println("alert('신고 실패했습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
	}
	
	
	
	
	
	
}