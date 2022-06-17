package com.sp.dev.lectureInquiry;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("lectureinquiry.lecinqservice")
public class LecInqServiceImpl implements LecInqService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertInquiry(LecInq dto) throws Exception {
		try {
			dao.insertData("lectureInquiry.insertInquiry", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<LecInq> listLecInq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LecInq readInq(int inquirynum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void answerInq(LecInq dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAnswer(int inquirynum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInq(int inquirynum) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
