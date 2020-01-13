package com.meet.me.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meet.me.domain.Category;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;
import com.meet.me.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck.net", method = RequestMethod.GET)
	public void idcheck(@RequestParam("user_id") String user_id, // 파라미터로 받은 값을 String id 저장
			HttpServletResponse response) throws Exception {
		int result = userService.isId(user_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}// idcheck

	
	// 회원가입 처리
	@RequestMapping(value = "/joinProcess.net", method = RequestMethod.POST)
	public String joinProcess(User user, HttpServletResponse response,
			@RequestParam("sel_category") String sel_category, RedirectAttributes rttr) throws Exception {
		
		String user_id = user.getUser_id();
		String tmp[] = sel_category.split(",");
		List<Integer> cat_list = new ArrayList<Integer>(); 
		for (int i = 0; i < tmp.length; i++) {
			if (tmp[i] != null && !tmp[i].equals("")) {
				cat_list.add(Integer.parseInt(tmp[i]));
			}
		}
		

		MultipartFile uploadfile = user.getUploadfile();
		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
			user.setUser_original(fileName); // 원래 파일명 저장

			// 새로운 폴더 이름 : 오늘 년+월+일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년 구합니다.
			int month = c.get(Calendar.MONTH) + 1;// 오늘 월 구합니다.
			int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
			// String
			// saveFoler=request.getSession().getServletContext().getRealPath("resources") +
			// "/upload/";
			String saveFolder = "D:\\final\\meetme\\meetme2\\src\\main\\webapp\\resources\\upload\\";
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
			// 오라클 디비에 저장될 파일명
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			user.setUser_save(fileDBName);
		}
	
			userService.insert(user); // 저장 메서드 호출
			rttr.addFlashAttribute("msg", "regSuccess");
			
			user = userService.getNum(user_id);
			
			int user_num = user.getUser_num();
			
			User_interests inter = new User_interests();
			
			inter.setUser_num(user_num);
			
			for(int i : cat_list) {
				inter.setCategory_num(i);
				userService.category(inter);
			}
			
			userService.setMyhome(user_num);
	
			
			return "main/main";

	}// joinProcess
	
	@RequestMapping(value = "/emailConfirm.net", method = RequestMethod.GET)
	public String emailConfirm(User user, String user_email, String user_id, Model model) throws Exception { // 이메일 인증 확인창
		System.out.println("user_email : " + user_email);
		System.out.println("user_id" + user_id);
		
		user = userService.getNum(user_id);
		
		user_email = user.getUser_email();
		System.out.println("user_email2 : " + user_email);
		
		userService.userAuth(user_email);
		model.addAttribute("user_email", user_email);

		return "user/emailConfirm"; // emailConfirm.jsp
	}

	// 로그인 처리
	@RequestMapping(value = "/loginProcess.net", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("user_id1") String user_id, @RequestParam("user_pass1") String user_pass,
			@RequestParam(value = "u", defaultValue = "") String u, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		User user = new User();
		int result = userService.isId(user_id, user_pass);
		user = userService.user_info(user_id);
	
		if (result == 1) {
			int user_num = user.getUser_num();
			int certification = user.getUserCertification();
			
			if(certification == 1) {
				// 로그인 성공
				session.setAttribute("user_id1", user_id);
				session.setAttribute("user_num1", user_num);
				// "saveid"라는 이름의 쿠키에 id의 값을 저장한 쿠키를 생성합니다.
				Cookie savecookie = new Cookie("saveid", user_id);
				if (!u.equals("")) {
					savecookie.setMaxAge(60 * 60);
					System.out.println("쿠키저장 : 60*60초");
				} else {
					System.out.println("쿠키저장 : 0");
					savecookie.setMaxAge(0);
				}
				response.addCookie(savecookie);
			} else {
				String message = null;
				message = "이메일 인증을 해주세요.";
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('" + message + "');");
				out.println("location.href='main.index';");
				out.println("</script>");
				out.close();
				return null;
			}
			return "redirect:main.index";
		} else {
			String message = null;
			
			if(result == 0) {
				message = "비밀번호가 일치하지 않습니다.";
			}else if (result == -1) {
				message = "아이디가 존재하지 않습니다.";
			}
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

	// 로그아웃
	@RequestMapping(value = "/logout.net", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:main.index";

	}
}
