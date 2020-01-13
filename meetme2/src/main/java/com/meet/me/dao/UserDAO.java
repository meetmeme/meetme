package com.meet.me.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Category;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;

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

	public List<User> getSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Users.getSearchList", map);
	}
	
	public int getSearchListCount(Map<String, String> map) {
		return sqlSession.selectOne("Users.searchcount", map);
	}

	public User user_info(String user_id) {
		return sqlSession.selectOne("Users.idcheck",user_id);
	}
	
	public int update(User u) {
		return sqlSession.update("Users.update",u);
	}

	public int delete(String user_id) {
		return sqlSession.delete("Users.delete", user_id);
	}

	public User getUsernum(String user_id) {
		return sqlSession.selectOne("Users.selectNum", user_id);
		
	}

	public void insertCat(User_interests user_inter) {
		sqlSession.insert("Users.insert_inter", user_inter);
	}

	public void createAuthKey(String user_email, String authKey) throws Exception { // 인증키 DB에 넣기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user_email", user_email);
		map.put("authKey", authKey);

		sqlSession.selectOne("Users.createAuthKey", map);
	}

	public void userAuth(String user_email) throws Exception { // 인증키 일치시 DB칼럼(인증여부) false->true 로 변경
		sqlSession.update("Users.userAuth", user_email);
	}

	public void setMyhome(int user_num) {
		sqlSession.insert("Users.myhome", user_num);
	}

	
	
	
}
