package com.sp.dev.lectures;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("lectures.lecturesService")
public class LectureUploadServiceImpl implements LectureUploadService {
	@Autowired
	CommonDAO dao;
	
	@Override
	public Lectures readLecture(String memberEmail) {
		return null;
	}

	@Override
	public void insertLecture(Lectures dto) throws Exception {
		try {
			dao.insertData("instructorPage.insertLecture", dto);
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
		List<Lectures> list = null;
		
		try {
			list = dao.selectList("instructorPage.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Lectures> listSubCategory() {
		List<Lectures> list = null;
		
		try {
			list = dao.selectList("instructorPage.listSubCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
