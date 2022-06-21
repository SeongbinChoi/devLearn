package com.sp.dev.lectures;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("Lectures.LecturesPageService")
public class LecturesServiceImpl implements LecturesService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Lectures readLecture(int lectureNum) {
		Lectures dto = null;
		
		try {
			dto = dao.selectOne("lectures.readLecture", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return dto;
	}

	@Override
	public void insertLecture(Lectures dto) throws Exception {
		// TODO Auto-generated method stub
		
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

	@Override
	public List<Lectures> listLecture(Map<String, Object> map) {
		List<Lectures> list = null;
		
		try {
			list = dao.selectList("lectures.listLecture", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertLectureLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLectureLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int lectureLikeCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean memberLectureLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("lectures.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	
}
