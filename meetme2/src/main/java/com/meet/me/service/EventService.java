package com.meet.me.service;

import java.util.List;
import java.util.Map;

import com.meet.me.domain.Event;
import com.meet.me.domain.Gallery;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.User;
public interface EventService {
	public List<String> getCategory();
	public List<Event> getIntrestingEvent(String id);
	public Event getDetail(int event);
	public List<Event> search(Map<String, String> keywords);
	public List<Event> searchDate(Map<String, String> keywords);
	public List<Event> searchHash(String hashtag);
	public int getAttend(int event);
	public List<User> getUser(int event);
	public List<Event> searchCat(String category);
	public int insertEvent(Event event) throws Exception;
	public int has(String string);
	public int insertTagUse(int tag_num, int event_num);
	public void insertHashtag(String string);
	public int getUSER_NUM(String id);
	public int getEventnum();
	public void insertGallery(Gallery gall);
	public List<Gallery> getGall(int event);
	public List<Hashtag> getHashtag(int event);
	public List<Event> alleventinfo(int u_id);
}
 