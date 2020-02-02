package com.meet.me.service;

import java.util.List;
import java.util.Map;

import com.meet.me.domain.BGM;
import com.meet.me.domain.Board;
import com.meet.me.domain.Comment;
import com.meet.me.domain.Follows;
import com.meet.me.domain.Message;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;


public interface MyHomeService {

	public MyHome getinfo(String user_id);
	public List<User> search(Map<String, String> keywords);
	public List<User> searchHash(String hashtag);
	public void update(MyHome myhome);
//	public int board_insert(Board board);
	public void insertBoard(Board board);
	public int getListCount(String u_id);
	public List<Board> boardlist(int page, int limit, String u_id);
	public List<Follows> follows(int m_num);
	public Board getDetail(int num);
	public int boardModify(Board board);
	public List<Comment> getCommentList(int BOARD_USER_NUM);
	public int commentsDelete(int num);
	public int commentUpdate(Comment c);
	public int commentsInsert(Comment c);	
	public List<Message> sendmessage(int u_num);
	public List<Message> receivemessage(int u_num);
	public int boardDelete(int num);
	public List<BGM> getbgm();
}
