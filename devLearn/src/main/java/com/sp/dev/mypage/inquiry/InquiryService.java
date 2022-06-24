package com.sp.dev.mypage.inquiry;

import java.util.List;
import java.util.Map;

public interface InquiryService {
	public int dataCount(Map<String, Object> map);
	public List<Inquiry> inquiryList(Map<String, Object> map);
	
	public void deleteInquiry(int inquiryNum);
}
