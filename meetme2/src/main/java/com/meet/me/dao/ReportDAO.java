package com.meet.me.dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Report;
@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int userCount() {
		return sqlSession.selectOne("Report.userCount");
	}

	public int eventCount() {
		return sqlSession.selectOne("Report.eventCount");
	}

	public List<Report> userReport() {
		return sqlSession.selectList("Report.userReport");
	}

	public List<Report> eventReport() {
		return sqlSession.selectList("Report.eventReport");
	}

	public void u_alert(int user_num) {
		sqlSession.insert("Report.u_alert", user_num);
	}
	
	public void e_alert(int event_num) {
		sqlSession.insert("Report.e_alert", event_num);
	}

	public void addCheck(int report_num) {
		sqlSession.update("Report.addCheck", report_num);
	}

	public void delUser(int user_num) {
		sqlSession.delete("Report.delUser", user_num);
	}

	public void delEvent(int event_num) {
		sqlSession.delete("Report.delEvent", event_num);
	}

	public List<Report> userAlertCount() {
		return sqlSession.selectList("Report.uAlertC");
	}

	public List<Report> eventAlertCount() {
		return sqlSession.selectList("Report.eAlertC");
	}
 
	public String getId(int user_num) {
		return sqlSession.selectOne("Report.getId", user_num);
	}

	public String getEvent(int event_num) {
		return sqlSession.selectOne("Report.getEvent", event_num);
	}

	public int myhomeReport(Report report) {
		return sqlSession.insert("Report.myhome_report", report);
	}




}
