package com.meet.me.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Category;
import com.meet.me.domain.User;
import com.meet.me.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/*
	//로그인 폼이동
	@RequestMapping(value = "/login.net", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value="saveid", required=false) Cookie readCookie) {
		if(readCookie != null){
			mv.addObject("saveid", readCookie.getValue());
		}
		return mv;
	}
	*/
	/*
	@RequestMapping(value = "/join.net", method = RequestMethod.GET)
	public String join() {
		return "user/joinForm";
	}
	*/
	
	//회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck.net", method = RequestMethod.GET)
	public void idcheck(@RequestParam("user_id") String user_id, //파라미터로 받은 값을 String id 저장 
					HttpServletResponse response) throws Exception {
		int result = userService.isId(user_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}//idcheck
	
	//회원가입 처리
	@RequestMapping(value = "/joinProcess.net", method = RequestMethod.POST)
	public String joinProcess(User user, int[] category_num,
					HttpServletResponse response) throws Exception{
		  MultipartFile uploadfile = user.getUploadfile();
		  if (!uploadfile.isEmpty()) {
		     String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
		 user.setOriginalfile(fileName); // 원래 파일명 저장
		
		 // 새로운 폴더 이름 : 오늘 년+월+일
		 Calendar c = Calendar.getInstance();
		 int year = c.get(Calendar.YEAR); // 오늘 년 구합니다.
		 int month = c.get(Calendar.MONTH) + 1;// 오늘 월 구합니다.
		 int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
		 // String
		 // saveFoler=request.getSession().getServletContext().getRealPath("resources") +
		 // "/upload/";
		 String saveFolder = "D:\\final\\meetme2\\src\\main\\webapp\\resources\\upload\\";
		 String homedir = saveFolder + year + "-" + month + "-" + date;
		 System.out.println(homedir);
		 File path1 = new File(homedir);
		 if (!(path1.exists())) { // 이 파일의 경로가 존재하는지 확인
		path1.mkdir(); // 없을 경우 경로 만들기
		 }
		
		 Random r = new Random();
		 int random = r.nextInt(100000000);
		
		 int index = fileName.lastIndexOf(".");
		 System.out.println("index = " + index);
		 String fileExtension = fileName.substring(index + 1); // 확장자만 따로 뻄
		 System.out.println("fileExtension = " + fileExtension);
		 String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		 System.out.println("refileName = " + refileName);
		//오라클 디비에 저장될 파일명
		 String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		 System.out.println("fileDBName = " + fileDBName);
		 //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
		 uploadfile.transferTo(new File(saveFolder + fileDBName));
		//바뀐 파일명으로 저장
		     user.setSavefile(fileDBName);
		  }
		  userService.insert(user); //저장 메서드 호출
		  int user_num = user.getUser_num();
		  userService.categoryInsert(user_num, category_num);
		  return "main/main";
		
	}//joinProcess
	
	//로그인 처리
	@RequestMapping(value = "/loginProcess.net", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("user_id1")String user_id,
								@RequestParam("user_pass1")String user_pass,
								@RequestParam(value="u", defaultValue="") String u,
								HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session)throws Exception{
		int result = userService.isId(user_id, user_pass);
		System.out.println("결과는 " + result);
		
		if(result == 1) {
			//로그인 성공
			session.setAttribute("user_id1", user_id);
			//"saveid"라는 이름의 쿠키에 id의 값을 저장한 쿠키를 생성합니다.
			Cookie savecookie = new Cookie("saveid", user_id);
			if(!u.equals("")) {
				savecookie.setMaxAge(60*60);
				System.out.println("쿠키저장 : 60*60초");
			}else {
				System.out.println("쿠키저장 : 0");
				savecookie.setMaxAge(0);
			}
			response.addCookie(savecookie);
			
			return "redirect:main.index";
		}else {
			String message = "비밀번호가 일치하지 않습니다.";
			if(result == -1)
				message = "아이디가 존재하지 않습니다.";
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");			
			out.println("alert('" + message + "');");
			out.println("location.href='main.index';");			
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
	
	//로그아웃
	@RequestMapping(value="/logout.net", method=RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:main.index";

	}
}
