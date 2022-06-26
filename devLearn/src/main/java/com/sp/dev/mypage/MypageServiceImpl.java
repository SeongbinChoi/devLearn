package com.sp.dev.mypage;

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

}
