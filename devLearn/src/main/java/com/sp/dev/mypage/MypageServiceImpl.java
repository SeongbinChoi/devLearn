package com.sp.dev.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public DashBoard readDash(Map<String, Object> map) {
		DashBoard dto = null;
		
		try {
			dto = dao.selectOne("my.readDash", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public DashLecture dashLectureCount(Map<String, Object> map) {
		DashLecture dto = null;
		try {
			dto = dao.selectOne("my.dashLectureCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<DashLecture> dashRecentLecture(Map<String, Object> map) {
		List<DashLecture> list = null;
		try {
			list = dao.selectList("my.dashRecentLecture", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
