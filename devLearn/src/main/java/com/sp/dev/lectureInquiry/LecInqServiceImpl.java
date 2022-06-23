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
		int result = 0;
		
		try {
			result = dao.selectOne("lectureInquiry.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<LecInq> listLecInq(Map<String, Object> map) {
		List<LecInq> list = null;
		
		try {
			list = dao.selectList("lectureInquiry.listLecInq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertAnswer(LecInq dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteInquiry(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("lectureInquiry.deleteInquiry", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAnswer(int inquirynum) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
