package com.meet.me.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.EventDAO;
import com.meet.me.domain.Attendee;
import com.meet.me.domain.Event;
import com.meet.me.domain.EventComment;
import com.meet.me.domain.Gallery;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.User;
@Service
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDAO dao;

	@Override
	public List<String> getCategory() {
		return dao.getCategory();
	}

	@Override
	public List<Event> getIntrestingEvent(List<String> InterestingCats) {
		return dao.getIntrestingEvent(InterestingCats);
	}
	
	@Override
	public Event getDetail(int event_num) {		
		return dao.getDetail(event_num);
	}

	@Override
	public List<Event> search(Map<String, String> keywords) {
		return dao.search(keywords);
	}

	@Override
	public List<Event> searchDate(Map<String, String> keywords) {
		return  dao.searchDate(keywords);
	}

	@Override
	public List<Event> searchHash(String hashtag) {
		return dao.searchHash(hashtag);
	}

	@Override
	public int getAttend(int event) {
		return dao.attend(event);
	}

	@Override
	public List<User> getUser(int event) {
		return dao.getUser(event);
	}

	@Override
	public List<Event> searchCat(String category) {
		return dao.searchCat(category);
	}
	
	@Override
	public int insertEvent(Event event) throws Exception {		
		return dao.insertEvent(event);	
	}

	@Override
	public int has(String tag) {
		Hashtag hashtag = dao.has(tag);
		int result = 0;
		if(hashtag != null) 
			result = hashtag.getHASHTAG_NUM();
		System.out.println("태그 결과"+result);
		return result;
	}

	@Override
	public int insertTagUse(int tag_num, int event_num) {
		return dao.insertTagUse(tag_num, event_num);
	}

	@Override
	public void insertHashtag(String title) {
		dao.insertHashtag(title);
	}

	@Override
	public int getUSER_NUM(String id) {
		return dao.getnum(id);
	}

	@Override
	public int getEventnum() {
		return dao.getEventnum();
	}

	@Override
	public void insertGallery(Gallery gall) {
		dao.insertGallery(gall);
	}

	@Override
	public List<Gallery> getGall(int event) {
		return dao.getGall(event);
	}

	@Override
	public List<Hashtag> getHashtag(int event) {
		return dao.getHashtag(event);
	}

	@Override
	public List<Event> alleventinfo(int u_num) {
		return dao.alleventinfo(u_num);
	}

	@Override
	public List<Event> expectedeventinfo(int u_num) {
		return dao.expectedeventinfo(u_num);
	}

	@Override
	public List<Event> pasteventinfo(int u_num) {
		return dao.pasteventinfo(u_num);
	}
	public int getRemain(int event) {
		return dao.getRemain(event);
	}

	@Override
	public int isAttend(Attendee att) {
		return dao.isAttend(att);
	}

	@Override
	public int insertAttend(Attendee att) {
		return dao.insertAttend(att);
	}

	@Override
	public int deleteAttend(Attendee att) {
		return dao.cancelAttend(att);
	}

	@Override
	public int writeComment(EventComment co) {
		return dao.writeComment(co);
	}

	@Override
	public List<EventComment> getComment(int event) {
		return dao.getComment(event);
	}

	@Override
	public int comDelete(int num) {
		return dao.comDelete(num);
	}

	@Override
	public int comUpdate(EventComment co) {
		return dao.comUpdate(co);
	}

	@Override
	public List<User> getAllU(int event) {
		return dao.getAllU(event);
	}


}
