package com.sp.dev.mypage.inquiry;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.inquiry.inquiryService")
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("my.inquiryDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Inquiry> inquiryList(Map<String, Object> map) {
		List<Inquiry> list = null;
		try {
			list = dao.selectList("my.inquiryList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteInquiry(int inquiryNum) {
		try {
			dao.deleteData("my.deleteInquiry", inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
