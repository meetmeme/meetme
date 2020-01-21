package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meet.me.MailHandler;
import com.meet.me.TempKey;
import com.meet.me.dao.UserDAO;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO dao;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public int isId(String user_id, String user_pass) {
		User u = dao.isId(user_id);
		int result = -1; // 아이디가 존재하지 않는 경우- u가 null인 경우
		if (u != null) { // 아이디가 존재하는 경우
			if (u.getUser_pass().equals(user_pass)) {
				result = 1; // 아이디와 비밀번호가 일치하는 경우
			} else {
				result = 0; // 아이디는 존재하지만 비밀번호가 일치하지 않는 경우
			}
		}
		return result;
	}

	@Override
	public int isId(String user_id) {
		User u = dao.isId(user_id);
		return (u == null) ? -1 : 1; // -1은 아이디가 존재하지 않는 경우
										// 1은 아이디가 존재하는 경우
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
		sendMail.setSubject("[Meet Me] Welcome to Meet Me!"); // 메일제목
		sendMail.setText( // 메일내용
				"<div style='text-align: center;'>"
				+ "<hr><h1>✨Welcome to the Meet Me!✨</h1><hr><br><br>" 
				+ "<span>🤩Let's M&M! <br>Thanks for joining us!😍</span><br><br>" 
				+ "<h2>💃🏻환영합니다, <strong>"+user.getUser_name()+"님!</strong>🕺🏻</h2><br><br>" 
				+ "<span>직접 만나 함께하는 즐거움!! <br>로컬 이벤트에 참여하고 사람들과 좋아하는 일을 함께하며 <br>새로운 경험을 즐겨보세요👏👏</span><br><br><hr>" 
				+ "<a href='localhost:8088/me/emailConfirm.net?user_id="
				+ user.getUser_id() + "&key=" + key + "' target='_blank'>👉🏻이메일 인증하기👈🏻</a>"
				+ "<hr></div>");
		sendMail.setFrom("account@meetme.com", "MeetMe"); // 보낸이
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

	@Override
	public List<User> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (index != -1) {
			String[] search_field = new String[] { "user_num", "user_id", "user_name" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();

		if (index != -1) {
			map.put("search_word", "%" + search_word + "%");
		}

		return dao.getSearchListCount(map);
	}

	@Override
	public int delete(String user_id) {
		return dao.delete(user_id);
	}

	@Override
	public List<User> getFriends(String title, int userNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", "%" + title + "%");
		map.put("userNum", userNum + "");
		return dao.getFriends(map);
	}

	public int isEmail(String user_email) {
		User u = dao.isEmail(user_email);
		return (u == null) ? -1 : 1;
	}

	public List<User> getRandomUser() {
		return dao.getRandomUser();
	}

	@Override
	public List<User_interests> getInterestsNums(int num) {
		return dao.getInterestsNums(num);
	}

	@Override
	public int update(User user) {
		return dao.update(user);
	}

	@Override
	public int delete_interests(String user_id) {
		return dao.delete_interests(user_id);
	}

	@Override
	public int follow(Map<String, String> userKey) {
		return dao.follow(userKey);
	}

	@Override
	public int followCheck(Map<String, String> userKey) {
		return dao.followCheck(userKey);
	}
}
