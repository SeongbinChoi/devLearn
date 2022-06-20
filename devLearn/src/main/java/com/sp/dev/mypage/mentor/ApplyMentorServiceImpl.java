package com.sp.dev.mypage.mentor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.mentor.applyMentorService")
public class ApplyMentorServiceImpl implements ApplyMentorService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int mentorDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("my.mentorDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ApplyMentor> mentorList(Map<String, Object> map) {
		List<ApplyMentor> list = null;
		
		try {
			list = dao.selectList("my.mentorList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ApplyMentor readMentor(Map<String, Object> map) {
		ApplyMentor dto = null;
		
		try {
			dto = dao.selectOne("my.readMentor", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<ApplyMentor> status1(Map<String, Object> map) {
		List<ApplyMentor> list = null;
		
		try {
			list = dao.selectList("my.status1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateStatus(int mentoringNum) {
		try {
			dao.updateData("my.statusUpdate", mentoringNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertMentorReview(ApplyMentor dto) {
		try {
			dao.insertData("my.insertMentorReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ApplyMentor readMentorReview(int mentoringNum) {
		ApplyMentor dto = null;
		try {
			dto = dao.selectOne("my.readMentorReview", mentoringNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateMentorReview(ApplyMentor dto) {
		try {
			dao.updateData("my.updateMentorReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
