package com.sp.dev.mentorPage;

import java.util.List;

import com.sp.dev.mentors.Mentors;

public interface MentorPageService {
	public Mentors readMentoring(String memberEmail);
	public void insertMentoring(Mentors dto) throws Exception;
	public void updateMentoring(Mentors dto) throws Exception;
	public List<Mentors> listCategory();
}
