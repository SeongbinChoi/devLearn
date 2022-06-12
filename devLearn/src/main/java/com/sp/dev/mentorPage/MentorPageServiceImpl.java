package com.sp.dev.mentorPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;
import com.sp.dev.mentors.Mentors;

@Service("mentorPage.mentorPageService")
public class MentorPageServiceImpl implements MentorPageService {
	@Autowired
	CommonDAO dao;
	
	@Override
	public Mentors readMentoring(String memberEmail) {
		Mentors dto = null;
		
		try {
			dto = dao.selectOne("mentorPage.readMentoring", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void insertMentoring(Mentors dto) throws Exception {
		
		try {
			dao.updateData("mentorPage.insertMentoring", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMentoring(Mentors dto) throws Exception {
		try {
			dao.updateData("mentorPage.updateMentoring", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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

	
}
