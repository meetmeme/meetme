package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.MyhomeDAO;
import com.meet.me.domain.Board;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;

@Service
public class MyHomeServiceImpl  implements MyHomeService{
	
	@Autowired
	MyhomeDAO mhdao;
	public MyHome getinfo(String user_id) {
		return mhdao.getinfo(user_id);
	}
	@Override
	public List<User> search(Map<String, String> keywords) {
		return mhdao.search(keywords);
	}
	@Override
	public List<User> searchHash(String hashtag) {
		return mhdao.searchHash(hashtag);
	}
	@Override
	public void update(MyHome myhome) {
		mhdao.update(myhome);
	}
//	@Override
//	public int board_insert(Board board) {
//		return mhdao.board_insert(board);
//	}
	@Override
	public void insertBoard(Board board) {
		mhdao.insertBoard(board);
	}
	@Override
	public int getListCount(String u_id) {
		return mhdao.getListCount(u_id);
	}
//	@Override
//	public List<Board> boardlist(int page, int limit) {
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//
//		int startrow = (page - 1) * limit + 1;
//		int endrow = startrow + limit - 1;
//
//		map.put("start", startrow);
//		map.put("end", endrow);
//		//double i = 1/0; //AfterThrowing 확인하기 위해 ㅏ용
//		return mhdao.getBoardList(map);
//	}
	@Override
	public List<Board> boardlist(int page, int limit, String u_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		map.put("start", startrow);
		map.put("end", endrow);
		map.put("u_id", u_id);
		return mhdao.getBoardList(map);
	}
}
