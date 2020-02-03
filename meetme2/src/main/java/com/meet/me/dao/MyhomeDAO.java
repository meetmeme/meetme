package com.meet.me.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.BGM;
import com.meet.me.domain.Board;
import com.meet.me.domain.Comment;
import com.meet.me.domain.Follows;
import com.meet.me.domain.Message;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;

@Repository
public class MyhomeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MyHome getinfo(String user_id) {
		return sqlSession.selectOne("Myhomes.info", user_id);
	}

	public List<User> search(Map<String, String> keywords) {
		return sqlSession.selectList("Myhomes.search", keywords);
	}

	public List<User> searchHash(String hashtag) {
		return sqlSession.selectList("Myhomes.searchHash", hashtag);
	}

	public void update(MyHome myhome) {
		sqlSession.update("Myhomes.update", myhome);
	}

	public void insertBoard(Board board) {
		sqlSession.insert("Myhomes.board_insert", board);
	}

	public int getListCount(String u_id) {
		return sqlSession.selectOne("Myhomes.board_count", u_id);
	}

	public List<Board> getBoardList(HashMap<String, Object> map) {
		return sqlSession.selectList("Myhomes.board_list", map);
	}

	public List<Follows> follows(int m_num) {
		return sqlSession.selectList("Follows.followlist", m_num);
	}

	public Board getDetail(int num) {
		return sqlSession.selectOne("Myhomes.board_detail", num);
	}

	public int boardModify(Board board) {
		return sqlSession.insert("Myhomes.board_modify", board);
	}

	public List<Comment> getcommentlist(int board_user_num) {
		return sqlSession.selectList("Myhomes.comment_list", board_user_num);
	}

	public int commentdelete(int num) {
		return sqlSession.delete("Myhomes.comment_delete",num);
	}

	public int commentupdate(Comment c) {
		return sqlSession.update("Myhomes.comment_update", c);
	}

	public int commentinsert(Comment c) {
		return sqlSession.insert("Myhomes.comment_insert", c);
	}

	public List<Message> sendmessage(int u_num){
		return sqlSession.selectList("Myhomes.sendmessage", u_num);
	}

	public List<Message> receivemessage(int u_num){
		return sqlSession.selectList("Myhomes.receivemessage", u_num);
	}

	public int boardDelete(int num) {
		return sqlSession.delete("Myhomes.board_delete", num);
	}

	public List<BGM> getbgm() {
		return sqlSession.selectList("Myhomes.getbgm");
	}

	public List<Board> searchBoard(Map<String, String> keywords) {
		return sqlSession.selectList("Myhomes.searchBoard", keywords);
	}
	
}
