package com.meet.me.controller;

import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.User;
import com.meet.me.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/main.net", method = RequestMethod.GET)
	public String login() {
		return "main/main";
	}
	 
	//로그인 폼이동
	@RequestMapping(value = "/login.net", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value="saveid", required=false) Cookie readCookie) {
		if(readCookie != null){
			mv.addObject("saveid", readCookie.getValue());
		}
		mv.setViewName("user/loginForm");
		return mv;
	}
	
	@RequestMapping(value = "/join.net", method = RequestMethod.GET)
	public String join() {
		return "user/joinForm";
	}
	
	//회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck.net", method = RequestMethod.POST)
	public void idcheck(@RequestParam("user_id") String user_id, //파라미터로 받은 값을 String id 저장 
					HttpServletResponse response) throws Exception {
		int result = userService.isId(user_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}//idcheck
	
	@RequestMapping(value = "/joinProcess.net", method = RequestMethod.POST)
	public void joinProcess(User u, //파라미터값을 VO클래스에서 set을 찾아서 알아서 담김. 컬럼명, 프로퍼티 이름, 폼의 네임속성의 이름 같게
					HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = userService.insert(u);
		out.println("<script>");
		// 삽입이 된 경우
		if(result == 1) {
			out.println("alert('회원 가입을 축하합니다.');");
			out.println("location.href='login.net';");
		}else if(result == -1) {
			out.println("alert('아이디가 중복되었습니다. 다시 입력하세요');");
			out.println("history.back()");// 비밀번호를 제외한 다른 데이터는 유지 되어있음
		}
		out.println("</script>");
		out.close();
	}//joinProcess
	
	//로그인 처리
	@RequestMapping(value = "/loginProcess.net", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("user_id")String user_id,
								@RequestParam("user_pass")String user_pass,
								@RequestParam(value="u", defaultValue="") String u,
								HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session)throws Exception{
		int result = userService.isId(user_id, user_pass);
		System.out.println("결과는 " + result);
		
		if(result == 1) {
			//로그인 성공
			session.setAttribute("user_id", user_id);
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
			
			return "redirect:main.net";
		}else {
			String message = "비밀번호가 일치하지 않습니다.";
			if(result == -1)
				message = "아이디가 존재하지 않습니다.";
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");			
			out.println("alert('" + message + "');");
			out.println("location.href='login.net';");			
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
	@RequestMapping(value = "/user_list.net")
	public ModelAndView userList(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="3", required=false) int limit,
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
		int startpage = ((page - 1)/10)*10 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지 수
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mv.setViewName("user/user_list");
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
	@RequestMapping(value = "/user_info.net", method = RequestMethod.GET)
	public ModelAndView user_info(@RequestParam("user_id") String user_id, ModelAndView mv) {
		User u = userService.user_info(user_id);
		mv.setViewName("user/user_info");
		mv.addObject("userinfo", u);
		
		return mv;
	}
	
	//수정 폼
	@RequestMapping(value="/user_update.net", method=RequestMethod.GET)
	public ModelAndView user_update(HttpSession session, ModelAndView mv) {
		String user_id = (String) session.getAttribute("user_id");
		User u = userService.user_info(user_id);
		mv.setViewName("user/updateForm");
		mv.addObject("userinfo", u);
		return mv;
	}
	
	//수정 처리
	@RequestMapping(value="/updateProcess.net", method=RequestMethod.POST)
	public void updateProcess(User u, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = userService.update(u);
		out.println("<script>");
		//삽입이 된 경우
		if(result==1) {
			out.println("alert('수정되었습니다.');");
			out.println("location.href='main.net';");
		} else {
			out.println("alert('회원 정보 수정에 실패했습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value="/user_delete.net", method=RequestMethod.GET)
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
		return "redirect:user_list.net";
	}
	
	//로그아웃
	@RequestMapping(value="/logout.net", method=RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login.net";
	}
}
