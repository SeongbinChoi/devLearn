package com.sp.dev.mypage.mentor;

import java.util.List;
import java.util.Map;

public interface ApplyMentorService {
	public int mentorDataCount(Map<String, Object> map);
	public List<ApplyMentor> mentorList(Map<String, Object> map);
	public ApplyMentor readMentor(Map<String, Object> map);
	
	public List<ApplyMentor> status1(Map<String, Object> map);
	public void updateStatus(int mentoringNum);
	
	public void insertMentorReview(ApplyMentor dto);
	public ApplyMentor readMentorReview(int mentoringNum);
	public void updateMentorReview(ApplyMentor dto);
}
