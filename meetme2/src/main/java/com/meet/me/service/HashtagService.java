package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Hashtag;

public interface HashtagService {
	public List<Hashtag> getHashtag(String title);

	public int searchHashtag(String hashtag);

}
 