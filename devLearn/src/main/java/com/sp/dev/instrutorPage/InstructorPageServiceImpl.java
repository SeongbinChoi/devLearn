package com.sp.dev.instrutorPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;
import com.sp.dev.lectures.Lectures;

@Service("instructorPage.instructorPageService")
public class InstructorPageServiceImpl implements InstructorPageService {
	@Autowired
	CommonDAO dao;
	
	@Override
	public Lectures readLecture(String memberEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertLecture(Lectures dto) throws Exception {
		try {
			dao.updateData("instructorPage.insertLecture", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateLecture(Lectures dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Lectures> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}

}
