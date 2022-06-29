package com.sp.dev.mentors;

import java.util.List;
import java.util.Map;

public interface MentorsService {
	
	public int dataCount(Map<String, Object> map);
	public List<Mentors> listMentoring(Map<String, Object> map);
	public List<Mentors> listCategory();
	
	public Mentors readMentors(int mentorNum);
	public Mentors readAbleTime(int mentorNum);
	public long readMentoringPaymentSeq();
	public int insertMentoringApply(Map<String, Object> map) throws Exception;
	public void insertMentoringPayment(Map<String, Object> map) throws Exception;
	public List<Mentors> mentorReviewList(int mentorNum);
	public Map<String, Object> ReviewstatisticInfo(int mentorNum);

}
