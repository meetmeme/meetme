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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;
import com.meet.me.service.CommunityService;
import com.meet.me.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private CommunityService communityService;

	// 회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck.net", method = RequestMethod.GET)
	public void idcheck(@RequestParam("user_id") String user_id, // 파라미터로 받은 값을 String id 저장
			HttpServletResponse response) throws Exception {
		int result = userService.isId(user_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}// idcheck

	// 회원가입폼에서 이메일 검사
	@RequestMapping(value = "/emailcheck.net", method = RequestMethod.GET)
	public void emailcheck(@RequestParam("user_email") String user_email, // 파라미터로 받은 값을 String email 저장
			HttpServletResponse response) throws Exception {
		int result = userService.isEmail(user_email);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}// emailcheck

	// 회원가입 처리
	@RequestMapping(value = "/joinProcess.net", method = RequestMethod.POST)
	public String joinProcess(User user, HttpServletResponse response, HttpServletRequest request,
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
			String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";
//			String saveFolder = "C:\\Users\\user1\\git\\meetme\\meetme2\\src\\main\\webapp\\resources\\upload\\";
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
			// 오라클 디비에 저장될 파일명
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			user.setUser_save(fileDBName);
		}

		userService.insert(user); // 저장 메서드 호출
		rttr.addFlashAttribute("msg", "regSuccess");

		User user1 = userService.getNum(user_id);

		int user_num = user1.getUser_num();

		User_interests inter = new User_interests();

		inter.setUser_num(user_num);

		for (int i : cat_list) {
			inter.setCategory_num(i);
			userService.category(inter);
		}

		userService.setMyhome(user_num);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('입력하신 이메일 주소에 로그인하여 이메일 인증을 해주세요');");
		out.println("location.href='main.index';");
		out.println("</script>");
		out.close();

		return "redirect:main.index";

	}// joinProcess

	@RequestMapping(value = "/emailConfirm.net", method = RequestMethod.GET)
	public String emailConfirm(User user, String user_email, String user_id, Model model) throws Exception { // 이메일 인증
																												// 확인창
		user = userService.getNum(user_id);

		user_email = user.getUser_email();

		userService.userAuth(user_email);
		model.addAttribute("user_email", user_email);
		model.addAttribute("user_id", user_id);

		// admin follow하기
		int userNum = userService.getNum(user_id).getUser_num();
		Map<String, String> userKey = new HashMap<String, String>();
		userKey.put("following", "1");
		userKey.put("userKey", userNum + "");
		userService.follow(userKey);

		userKey.put("following", userNum + "");
		userKey.put("userKey", "1");
		userService.follow(userKey);

		// 환영 알람
		communityService.addNotification(userNum, "Welcome to Meet Me!", "Meet Me에 가입하신 것을 환영합니다! 즐거운 하루 되세요😎");

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

			if (certification == 1) {
				// 로그인 성공
				session.setAttribute("user_id1", user_id);
				session.setAttribute("user_num1", user_num);
				session.setAttribute("user_name1", user.getUser_name());
				session.setAttribute("user_original", user.getUser_original());
				// "saveid"라는 이름의 쿠키에 id의 값을 저장한 쿠키를 생성합니다.
				Cookie savecookie = new Cookie("saveid", user_id);
				if (!u.equals("")) {
					savecookie.setMaxAge(60 * 60);
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

			if (result == 0) {
				message = "비밀번호가 일치하지 않습니다.";
			} else if (result == -1) {
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

	@GetMapping(value = "follow.us")
	@ResponseBody
	public int follow(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		String following = request.getParameter("following"); // follow 할 사람
		String userNum = session.getAttribute("user_num1").toString(); // 사용자

		Map<String, String> userKey = new HashMap<String, String>();
		userKey.put("following", following);
		userKey.put("userKey", userNum);

		int follow = userService.followCheck(userKey);
		if (follow > 0)
			return 0;
		if (follow <= 0)
			follow = userService.follow(userKey);
		return follow;
	}

	@PostMapping(value = "/setPasswordRequest.net") // 비밀번호 변경 메일 발송
	public String setPassword(HttpServletResponse response, @RequestParam("email") String email) throws Exception {
		// email check
		User result = userService.user_info_email(email);
		String msg;
		if (result == null) {
			msg = "존재하지 않는 이메일입니다.😓";
		} else {
			msg = "이메일이 발송되었습니다🤗 " + "이메일을 확인해주세요.";

			userService.setPW(result);
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
		return null;
	}

	@GetMapping(value = "setPasswordFromUser.net") // 비밀번호 변경 from User email
	public String setPassword(String user_num, String user_email, String key, Model m, HttpServletResponse response) throws Exception {
		System.out.println("비밀번호 메일 확인");
		System.out.println(user_num + " / " + user_email + " / " + key);

		if (key.length() <= 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 경로입니다🤯');");
			out.println("location.href='main.index';");
			out.println("</script>");
			out.close();
			return null;
		}
		m.addAttribute("user_num", user_num);
		m.addAttribute("user_email", user_email);
		m.addAttribute("HeaderComment", "Set your password");

		return "main/setPassword";
	}

	@PostMapping(value="setPassword.net") // 비밀번호 변경 from site
	public void setPassword(User u, HttpServletResponse response) throws Exception {
		int result = userService.setPassword(u);
		String msg;
		if(result <1) {
			msg = "뭔가 잘못됐습니다! 운영자에게 연락해주세요.";
		}else {
			msg = "🔐비밀번호가 성공적으로 변경되었습니다";
			
			// 비밀번호 변경 알람
			communityService.addNotification(u.getUser_num(), "🔑비밀변호 변경 알람", "비밀번호가 변경되었습니다. ");

		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='main.index';");
		out.println("</script>");
		out.close();
	}
}
