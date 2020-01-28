package com.meet.me.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Board;
import com.meet.me.domain.Follows;
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

//	public int board_insert(Board board) {
//		return sqlSession.insert("Myhomes.board_insert", board);
//	}

	public void insertBoard(Board board) {
		sqlSession.insert("Myhomes.board_insert", board);
	}

	public int getListCount(String u_id) {
		return sqlSession.selectOne("Myhomes.count", u_id);
	}

	public List<Board> getBoardList(HashMap<String, Object> map) {
		return sqlSession.selectList("Myhomes.list", map);
	}

	public List<Follows> follows(int m_num) {
		return sqlSession.selectList("Follows.followlist", m_num);
	}

	public Board getDetail(int num) {
		return sqlSession.selectOne("Myhomes.detail", num);
	}

	public int boardModify(Board board) {
		return sqlSession.insert("Myhomes.modify", board);
	}

}
