package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.MyhomeDAO;
import com.meet.me.domain.Board;
import com.meet.me.domain.Comment;
import com.meet.me.domain.Follows;
import com.meet.me.domain.Message;
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
	@Override
	public void insertBoard(Board board) {
		mhdao.insertBoard(board);
	}
	@Override
	public int getListCount(String u_id) {
		return mhdao.getListCount(u_id);
	}
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
	@Override
	public List<Follows> follows(int m_num) {
		return mhdao.follows(m_num);
	}
	@Override
	public Board getDetail(int num) {
		return mhdao.getDetail(num);
	}
	@Override
	public int boardModify(Board board) {
		return mhdao.boardModify(board);
	}
	@Override
	public List<Comment> getCommentList(int board_user_num) {
		return mhdao.getcommentlist(board_user_num);
	}
	@Override
	public int commentsDelete(int num) {
		return mhdao.commentdelete(num);
	}
	@Override
	public int commentUpdate(Comment c) {
		return mhdao.commentupdate(c);
	}
	@Override
	public int commentsInsert(Comment c) {
		return mhdao.commentinsert(c);
	}
	@Override
	public List<Message> sendmessage(int u_num) {
		return mhdao.sendmessage(u_num);
	}
	@Override
	public List<Message> receivemessage(int u_num) {
		return mhdao.receivemessage(u_num);
	}
	@Override
	public int boardDelete(int num) {
		return mhdao.boardDelete(num);
	}
}
