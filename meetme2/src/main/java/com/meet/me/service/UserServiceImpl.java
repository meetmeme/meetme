package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meet.me.MailHandler;
import com.meet.me.TempKey;
import com.meet.me.dao.UserDAO;
import com.meet.me.domain.Category;
import com.meet.me.domain.MailUtils;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private JavaMailSender mailSender;
	

	
	@Override
	public int isId(String user_id, String user_pass) {
		User u = dao.isId(user_id);
		int result = -1; //아이디가 존재하지 않는 경우- u가 null인 경우
		if(u != null) { //아이디가 존재하는 경우
			if(u.getUser_pass().equals(user_pass)) {
				result = 1; //아이디와 비밀번호가 일치하는 경우
			}else {
				result = 0; //아이디는 존재하지만 비밀번호가 일치하지 않는 경우
			}
		}
		return result;
	}


	@Override
	public int isId(String user_id) {
		User u = dao.isId(user_id);
		return (u == null) ? -1 : 1; //-1은 아이디가 존재하지 않는 경우
											//1은 아이디가 존재하는 경우
	}


	@Override
	public User user_info(String user_id) {
		return dao.user_info(user_id);
	}


	@Override
	public User getNum(String user_id) {
		return dao.getUsernum(user_id);
	}

	@Override
	public void category(User_interests user_inter) {
		dao.insertCat(user_inter);
	}
	
	@Transactional
	@Override
	public void insert(User user) throws Exception {
		dao.insert(user); // 회원가입 DAO
		String key = new TempKey().getKey(50, false); // 인증키 생성
		dao.createAuthKey(user.getUser_email(), key); // 인증키 DB저장
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[홈페이지 이메일 인증]"); // 메일제목
		sendMail.setText( // 메일내용
				"<h1>메일인증</h1>" +
				"<a href='localhost:8088/me/emailConfirm.net?user_id=" + user.getUser_id() +
				"&key=" + key +
				"' target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("tpaem0103@gmail.com", "MeetMe"); // 보낸이
		sendMail.setTo(user.getUser_email()); // 받는이
		sendMail.send();
	}

	@Override
	public void userAuth(String user_email) throws Exception {
		dao.userAuth(user_email);
	}


	@Override
	public void setMyhome(int user_num) {
		dao.setMyhome(user_num);
	}
	
}

