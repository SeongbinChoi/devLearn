package com.sp.dev.mentors;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mentors.mentorService")
public class MentorsServiceImpl implements MentorsService {
	@Autowired CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("mentors.dataCount", map);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<Mentors> listCategory() {
		List<Mentors> list = null;
		
		try {
			list = dao.selectList("mentors.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Mentors> listMentoring(Map<String, Object> map) {
		List<Mentors> list = null;
			
		try {
			list = dao.selectList("mentors.listMentoring", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Mentors readMentors(int mentorNum) {
		Mentors dto = null;
		
		try {
			dto = dao.selectOne("mentors.readMentors", mentorNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Mentors readAbleTime(int mentorNum) {
		Mentors dto = null;
		
		try {
			dto = dao.selectOne("mentors.readAbleTime", mentorNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insertMentoringApply(Map<String, Object> map) throws Exception {
			int lastIndex = 0;
		try {
			lastIndex = dao.insertData("mentors.insertMentoringApply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return lastIndex;
	}
	
	@Override
	public void insertMentoringPayment(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("mentors.insertMentoringPayment", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	

	@Override
	public List<Mentors> mentorReviewList(int mentorNum) {
		List<Mentors> list = new ArrayList<Mentors>();
		
		try {
			list = dao.selectList("mentors.mentorReviewList", mentorNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long readMentoringPaymentSeq() {
		long result = 0;
		
		try {
			result = dao.selectOne("mentors.readMentoringPaymentSeq");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	

}
