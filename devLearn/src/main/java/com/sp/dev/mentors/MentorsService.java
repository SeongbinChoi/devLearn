package com.sp.dev.mentors;

import java.util.List;
import java.util.Map;

public interface MentorsService {
	
	public int dataCount(Map<String, Object> map);
	public List<Mentors> listMentoring(Map<String, Object> map);
	public List<Mentors> listCategory();
	
	public Mentors readMentors(int mentorNum);
	public Mentors readAbleTime(int mentorNum);
}
