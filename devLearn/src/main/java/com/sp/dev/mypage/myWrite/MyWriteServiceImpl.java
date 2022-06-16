package com.sp.dev.mypage.myWrite;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.myWrite.myWriteService")
public class MyWriteServiceImpl implements MyWriteService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int qnaDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("myWrite.qnaDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<MyWrite> qnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
