package com.meet.me.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.google.gson.Gson;
import com.meet.me.domain.Message;
import com.meet.me.domain.User;
import com.meet.me.service.CommunityService;
import com.meet.me.service.UserService;

@Controller
public class CommunityController {
	@Autowired
	private UserService userService;

	@Autowired
	private CommunityService communityrService;
	
	@GetMapping(value="/getFriends.cm")
	public void getFriends(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String title = request.getParameter("param");
		int userNum = Integer.parseInt(session.getAttribute("user_num1").toString());
		List<User> friends = userService.getFriends(title, userNum);
		
		Gson gson = new Gson();
		String jsonList = gson.toJson(friends);
		response.getWriter().write(jsonList);
	}
	
	@PostMapping(value="/sendMsg.cm")
	public void sendMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int sender = Integer.parseInt(request.getParameter("user_num").toString()); 
		int recever = Integer.parseInt(request.getParameter("receiver_num").toString()); 
		String content = request.getParameter("msgContent").toString();
		
		Message msg = new Message();
		msg.setSENDER_ID(sender);
		msg.setRECEIVER_ID(recever);
		msg.setCONTENT(content);
		
		int result = communityrService.sendMsg(msg);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result == 1) {	//메세지 전송 성공
			out.println("<script>");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else {	//실패
			out.println("<script>");
			out.println("alert('Message 전송 실패했습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
	}
}
