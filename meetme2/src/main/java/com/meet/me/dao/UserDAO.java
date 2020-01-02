package com.meet.me.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.User;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insert(User u) {
		return sqlSession.insert("Users.insert", u);
	}
	
	public User isId(String user_id) {
		return sqlSession.selectOne("Users.idcheck", user_id);
	} 

	
	
}
