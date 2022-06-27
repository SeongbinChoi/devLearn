package com.sp.dev.mypage.myLecture;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.myLecture.myLectureService")
public class MyLectureServiceImpl implements MyLectureService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int myLectureDataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("my.myLectureDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyLecture> myLectureList(Map<String, Object> map) {
		List<MyLecture> list = null;
		try {
			list = dao.selectList("my.myLectureList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
