package com.sp.dev.mentorPage;

import java.util.List;
import java.util.Map;

import com.sp.dev.mentors.Mentors;

public interface MentorPageService {
	public Mentors readMentoring(String memberEmail);
	public void insertMentoring(Mentors dto) throws Exception;
	public void updateMentoring(Mentors dto) throws Exception;
	public List<Mentors> listCategory();
	public List<Mentors> listMentoringApply(Map<String, Object> map);
	public Mentors readMentoringApply(int mentoringNum); 
	public void updateMentoringApply(Map<String, Object> map) throws Exception;
}
