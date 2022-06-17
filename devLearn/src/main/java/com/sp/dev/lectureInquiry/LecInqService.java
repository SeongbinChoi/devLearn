package com.sp.dev.lectureInquiry;

import java.util.List;
import java.util.Map;

public interface LecInqService {
	public void insertInquiry(LecInq dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<LecInq> listLecInq(Map<String, Object> map);
	public LecInq readInq(int inquirynum);
	public void answerInq(LecInq dto) throws Exception;
	public void deleteAnswer(int inquirynum) throws Exception;
	public void deleteInq(int inquirynum) throws Exception;
	

}
