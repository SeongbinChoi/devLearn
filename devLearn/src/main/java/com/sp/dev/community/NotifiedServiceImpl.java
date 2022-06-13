package com.sp.dev.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("community.notifiedService")
public class NotifiedServiceImpl implements NotifiedService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertNotified(Notified dto) throws Exception {
		try {
			// 시퀀스 값 가져오기
			int seq = dao.selectOne("notified.seq");
			
			dto.setNotifynum(seq);
			
			dao.insertData("notified.insertNotified", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
